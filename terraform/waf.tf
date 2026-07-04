###############################################
# WAF Web ACL
###############################################

###############################################
# WAF Web ACL
###############################################

resource "aws_wafv2_web_acl" "enterprise_waf" {

  name  = "enterprise-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "enterpriseWAF"
    sampled_requests_enabled   = true
  }

  ###############################################
  # Common Rules
  ###############################################

  rule {

    name     = "AWSManagedCommonRules"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRules"
      sampled_requests_enabled   = true
    }

  }

  ###############################################
  # Known Bad Inputs
  ###############################################

  rule {

    name     = "AWSManagedKnownBadInputs"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "KnownBadInputs"
      sampled_requests_enabled   = true
    }

  }

  ###############################################
  # Amazon IP Reputation
  ###############################################

  rule {

    name     = "AWSManagedIPReputation"
    priority = 3

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesAmazonIpReputationList"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "IPReputation"
      sampled_requests_enabled   = true
    }

  }

  ###############################################
  # Rate Limiting
  ###############################################

  rule {

    name     = "RateLimit"
    priority = 4

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 100
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "RateLimit"
      sampled_requests_enabled   = true
    }

  }

  tags = {
    Name = "enterprise-waf"
  }

}

###############################################
# Associate WAF with ALB
###############################################

resource "aws_wafv2_web_acl_association" "alb" {

  resource_arn = aws_lb.app_alb.arn

  web_acl_arn = aws_wafv2_web_acl.enterprise_waf.arn

}
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
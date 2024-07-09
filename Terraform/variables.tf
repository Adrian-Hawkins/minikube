variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-test-222"
}

variable "services_file" {
  description = "Path to the JSON file containing the list of services"
  type        = string
  default     = "services.json"
}
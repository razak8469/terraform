variable "project_id" {
  description = "The ID of the project in which to provision resources"
  type        = string
  default     = "<PROJECT_ID>"
}

variable "name" {
  description = "Name of the buckets to create"
  type        = string
  default     = "<BUCKET_NAME>"
}

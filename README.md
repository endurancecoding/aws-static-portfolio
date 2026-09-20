# AWS Static Portfolio Website

A static personal portfolio website hosted on AWS using Amazon S3 and Amazon CloudFront, with automated CI/CD deployment through GitHub Actions.

## Architectural Diagram

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/86aff0eb919a95f25a0d50c4848cfcbde38d8ccd/architecture/b221ff52-c2b5-483b-83f2-7791ab71111c.png)

## Architecture

The application follows this flow:

User
  ↓
CloudFront
  ↓
Amazon S3

For deployment:

Developer
  ↓
GitHub
  ↓
GitHub Actions
  ↓
AWS IAM (OIDC)
  ↓
Amazon S3
  ↓
CloudFront Cache Invalidation

## AWS Services Used

- Amazon S3 — stores the static website files
- Amazon CloudFront — distributes the website globally and provides HTTPS
- AWS CloudFormation — defines and provisions the infrastructure as code
- AWS IAM — controls access to AWS resources
- GitHub Actions — automates website deployment
- GitHub OIDC — allows GitHub Actions to authenticate with AWS without storing long-lived AWS access keys

## Security

The S3 bucket is not publicly accessible.

CloudFront uses an Origin Access Control (OAC) to access objects in the S3 bucket.

The S3 bucket policy only allows the CloudFront distribution to retrieve website objects.

GitHub Actions authenticates with AWS using OpenID Connect (OIDC) rather than storing permanent AWS credentials in GitHub.

## Deployment

Website files are stored in the `website/` directory.

Infrastructure is defined in:

`infrastructure/template.yaml`

The deployment workflow is located at:

`.github/workflows/deploy.yml`

Whenever changes are pushed to the `main` branch, GitHub Actions:

1. Authenticates with AWS using OIDC
2. Retrieves the S3 bucket and CloudFront distribution information
3. Synchronizes the website files to S3
4. Invalidates the CloudFront cache

This makes the deployment automatic.

## Project Structure

```text
aws-static-portfolio/
├── website/
│   ├── index.html
│   ├── about.html
│   ├── projects.html
│   └── style.css
│
├── infrastructure/
│   └── template.yaml
│
├── scripts/
│   └── deploy.sh
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── .gitignore
└── README.md

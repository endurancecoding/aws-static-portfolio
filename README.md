# AWS Static Portfolio

A static portfolio website hosted on Amazon S3 and delivered through Amazon CloudFront.

This project was built as a practical introduction to deploying a web application using AWS cloud services. It demonstrates how a static website can be stored in Amazon S3 and delivered to users through Amazon CloudFront, while using GitHub for source-code management and project documentation.

---

## Project Overview

The goal of this project was to build and deploy a static portfolio website using AWS.

Rather than serving the website directly from a local development environment, the project uses cloud infrastructure to make the website accessible over the internet.

The core architecture consists of:

**User → Amazon CloudFront → Amazon S3**

The website's static files are stored in an Amazon S3 bucket. Amazon CloudFront sits in front of the S3 origin and distributes the website's content to users through its content delivery network.

This project provided hands-on experience with AWS infrastructure, cloud storage, content delivery, access management, and deployment.

### Project Goals

* Deploy a functional static website using AWS.
* Understand how Amazon S3 can be used to store website assets.
* Understand the role of Amazon CloudFront in delivering content.
* Work with AWS regions and cloud resources.
* Practice managing AWS resources through the AWS Management Console.
* Use GitHub to manage and document the project.
* Understand how different cloud services work together to deliver a web application.

---

## Architecture

The architecture for this project is intentionally simple:

```text
                    ┌──────────────────┐
                    │      User        │
                    │    Web Browser   │
                    └────────┬─────────┘
                             │
                             │ HTTPS
                             ▼
                    ┌──────────────────┐
                    │  Amazon CloudFront│
                    │  Content Delivery │
                    └────────┬─────────┘
                             │
                             │ Origin Request
                             ▼
                    ┌──────────────────┐
                    │    Amazon S3     │
                    │  Static Website  │
                    │      Files       │
                    └──────────────────┘
```

### Architecture Diagram

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/6a1b3277a369e3a434c3791e053f554c7f783176/screenshots/Architectural%20diagram.png)

### How the Architecture Works

1. A user requests the portfolio website through a web browser.
2. The request is handled by the Amazon CloudFront distribution.
3. CloudFront retrieves the required website content from the configured Amazon S3 origin when the content is not already available at an edge location.
4. The requested files are delivered to the user through CloudFront.
5. Static assets such as HTML, CSS, images, and other website resources are served as part of the website.

This architecture separates **storage** from **content delivery**:

* **Amazon S3** provides the storage layer.
* **Amazon CloudFront** provides the content delivery layer.
* **The user's browser** acts as the client accessing the application.

---

## AWS Services Used

| Service               | Purpose                                                                                          |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| **Amazon S3**         | Stores the static website files and acts as the origin for the website content.                  |
| **Amazon CloudFront** | Delivers website content through a global content delivery network.                              |
| **AWS IAM**           | Provides identity and access management for AWS resources and user access.                       |
| **Amazon EC2**        | Not used in the final architecture; this project does not require a continuously running server. |
| **GitHub**            | Stores the project source code, documentation, screenshots, and architecture diagram.            |

---

## Implementation

### 1. Website Development

The portfolio website was developed as a static website using front-end technologies.

The website consists of static resources that can be delivered without requiring a backend application server.

The project files were organized and maintained in a GitHub repository.

---

### 2. Amazon S3

Amazon S3 was used as the storage layer for the website.

The website files were uploaded to an S3 bucket in the **US East (N. Virginia) (`us-east-1`)** AWS Region.

The bucket contains the static resources required to render the portfolio website.

These resources can include:

* HTML files
* CSS files
* Images
* Other static website assets

The S3 bucket serves as the origin from which CloudFront obtains the website content.

### S3 Bucket

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/6a1b3277a369e3a434c3791e053f554c7f783176/screenshots/S3%20uploaded%20files.png)

---

### 3. Amazon CloudFront

Amazon CloudFront was configured as the content delivery layer for the website.

Instead of relying solely on direct access to the S3 origin, CloudFront provides a distribution layer between the user and the origin.

The CloudFront distribution is configured to use the S3 bucket as its origin.

This allows users to access the website through a CloudFront distribution URL.

### CloudFront Distribution

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/7c667c6141f13a6087ca59894bff2d8ea451ac58/screenshots/Cloudfront-distribution.png)

https://d28r5yd7uxpwqy.cloudfront.net/

---

### 4. Deployment

After configuring the S3 bucket and CloudFront distribution, the deployed website was tested through the CloudFront distribution URL.

The website successfully loaded through the CloudFront endpoint, demonstrating that the CloudFront distribution could retrieve and deliver the website content from the configured origin.

### Website Through CloudFront

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/7c667c6141f13a6087ca59894bff2d8ea451ac58/screenshots/Interface%20of%20the%20deployed%20website.png)

---

## Screenshots

The following screenshots provide visual evidence of the deployed infrastructure and final result.

### Final Website

The completed portfolio website as viewed by a user.

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/97b4f38c09c4a7f338dbc9c05ecd8cd308d14516/screenshots/The%20Final%20Deployed%20Site.png)

https://d28r5yd7uxpwqy.cloudfront.net/

---

### Amazon S3

The Amazon S3 bucket containing the static website files.

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/5d7d70f37649034c6ac570f52c19c63508ac42a1/screenshots/S3%20bucket%20name.png)

---

### Amazon S3 Configuraion

The S3 files were made private and configured in a way to allow only CloudFront to access them

![image alt](https://github.com/endurancecoding/aws-static-portfolio/blob/5d7d70f37649034c6ac570f52c19c63508ac42a1/screenshots/S3%20blocked%20public%20access.png)

---

## Project Structure

The repository is organized to keep the website source files, architecture documentation, and deployment evidence separate.

```text
aws-static-portfolio/
│
├── architecture/
│   └── architecture-diagram.png
│
├── screenshots/
│   ├── 01-website.png
│   ├── 02-s3-bucket.png
│   ├── 03-cloudfront-distribution.png
│   └── 04-cloudfront-website.png
│
├── index.html
├── style.css
└── README.md
```

### Repository Components

**`index.html`**
Contains the structure and content of the portfolio website.

**`style.css`**
Contains the styling and presentation of the website.

**`architecture/`**
Contains the architecture diagram used to document the AWS infrastructure.

**`screenshots/`**
Contains screenshots demonstrating the website and AWS infrastructure.

**`README.md`**
Contains the project documentation, architecture explanation, implementation details, and lessons learned.

---

## What I Learned

This project provided practical experience with several important cloud concepts.

### 1. Cloud Storage

I gained practical experience using Amazon S3 to store and manage static website files.

This helped reinforce the difference between storing application assets and running an application on a server.

### 2. Content Delivery Networks

I learned how Amazon CloudFront can sit between users and an origin to distribute content through a content delivery network.

This provided a practical introduction to the relationship between an origin and a CDN.

### 3. AWS Regions

The project also provided hands-on experience working with AWS Regions and understanding that AWS resources are created within specific geographical regions.

For this project, the resources were created in **`us-east-1`**.

### 4. Cloud Architecture

Building the project helped me understand how individual AWS services can be combined to form a complete architecture.

Instead of viewing S3 and CloudFront as isolated services, I was able to see how they work together:

```text
Storage → Delivery → User
   S3    → CloudFront → Browser
```

### 5. Infrastructure Documentation

I also learned the importance of documenting cloud infrastructure.

The architecture diagram, screenshots, project structure, and README provide a record of how the project was designed and implemented.

### 6. Git and GitHub

The project provided additional practice with GitHub as a place to store source code, documentation, architecture diagrams, and project evidence.

---

## Challenges Encountered

Building the project also involved working through several configuration decisions and AWS-specific challenges.

Some of the areas that required attention included:

* Understanding the relationship between an S3 bucket and CloudFront.
* Choosing the appropriate AWS Region for the personal project.
* Understanding CloudFront origin configuration.
* Understanding the difference between an S3 bucket and an S3 website endpoint.
* Configuring and testing the CloudFront distribution.
* Organizing project documentation and supporting files in GitHub.

Working through these issues was an important part of the learning process because the project involved configuring actual cloud resources rather than simply following a theoretical example.

---

## Future Improvements

This project provides a foundation that can be expanded into a more automated and production-oriented cloud deployment.

Potential improvements include:

### Custom Domain

Connect a custom domain to the CloudFront distribution using Amazon Route 53 and configure HTTPS for the custom domain.

### CI/CD Pipeline

Introduce continuous integration and continuous deployment using GitHub Actions so that changes pushed to the repository can automatically trigger a deployment process.

### Infrastructure as Code

Recreate the AWS infrastructure using **AWS CloudFormation** or another infrastructure-as-code solution.

This would make the infrastructure reproducible rather than requiring resources to be configured manually.

### Monitoring and Logging

Add appropriate AWS monitoring and logging services to gain visibility into website requests, errors, and infrastructure activity.

### Improved Security

Further refine the S3 and CloudFront configuration so that the storage layer is not unnecessarily exposed directly to the public while CloudFront acts as the primary delivery layer.

### Performance Optimization

Optimize static assets such as images, CSS, and JavaScript and evaluate CloudFront caching behavior to improve website performance.

---

## Conclusion

This project was my first practical AWS portfolio project and provided hands-on experience moving from a locally developed static website to a cloud-based deployment.

The project demonstrates a simple but important cloud architecture:

**Amazon S3 → Amazon CloudFront → User**

More importantly, it provided practical experience with AWS resource configuration, cloud architecture, content delivery, GitHub documentation, and troubleshooting.

This project serves as a foundation for progressing toward more advanced cloud and DevOps projects involving automation, infrastructure as code, CI/CD, monitoring, and more complex AWS architectures.

pipeline {
agent any
stages {
    stage ('Terraform init') {
        steps {
            sh 'terraform init'
        }        
    }
    stage ('Terraform apply') {
        steps {
            sh 'terraform apply --auto-approve'
        }        
    }
    stage ('Graph creation') {
        steps {
            sh 'terraform graph > graph.dot'
            sh 'dot -Tpng graph.dot -o graph.png'
            sh 'aws s3 cp ./graph.png terraform-bucket-shmuel-public-3'
        }
    }
}
}
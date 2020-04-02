Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web10.123.1585847353672927215
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Pu1adiz2;
 spf=pass (domain: arm.com, ip: 40.107.8.54, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=Pu1adiz25KCRpgRWl2WYLX8LfFnlYcauI0SeQ4hz+CpPbh2CLS+O8LwRnbAu7qDbzHsvVmA7Pn8uV7gTtbr+RZ4CSh+uqbjGNaJDTMnCeNwlGMdYTBiMqaxvEorAo4Ci2lm7MpPDObngfMidSc5yjj9FWWxbDvdUj3MscB0X1IE=
Received: from AM6PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:92::20)
 by AM5PR0801MB1618.eurprd08.prod.outlook.com (2603:10a6:203:37::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 17:09:11 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::84) by AM6PR04CA0007.outlook.office365.com
 (2603:10a6:20b:92::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 17:09:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:09:11 +0000
Received: ("Tessian outbound e2c88df8bbbe:v50"); Thu, 02 Apr 2020 17:09:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27162d6ca23b6b2d
X-CR-MTA-TID: 64aa7808
Received: from e87d636ce92a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9ED022E3-EA94-40E2-856B-3DAAEE78B79D.1;
	Thu, 02 Apr 2020 17:09:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e87d636ce92a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZw6IaErSlVHTvfpEqBniCluXjVJ1k/A5POeiSqFQMiucNeAGiKJgixtYqE3nfEW9Cz/wm+Ec1owDwGItLJIn8O03ipsqLJ6Hh4DAX6QWy9mzirM875h3q0Tzs6miWI32ONybfn/6/Nbuxszu20VDMa+cQ/40WT0CFeuywqkN7B+7GDvehODFqTBWV/kJFyBVtwmzP50kU9UdUkcaDkc6VPXkVYg1D2pppVD1HTPaRPCHd8vsfEt5qGp2INQeTu5oFKS3VWFzbO0rsFEeiF2mIdJ0NACtRC2PxD0ZoEUGHEYMX0ARRcX5ExMxbsbl6dSvTdtkVRkyWuFAO5hhy/Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=DOiPwrVyCJ/zh+EafUmdwtWvDqPFHySRpCGJgXCxisw+FEyKicqjvLVeIg2aX7oZbBBLRBkvHimL/TF0YM6q0PO8uqD4yHLm82QV5FvteYHVMBouuEXMUJhtD5vlsjnA7zFU2nwZ8dFQPrHwca0XoiRhVV0TG5cg6ifSzjCWbDJgvH9oEqXD1fcEoIqAPX8anMQeP4gOgxppLsHFYRUvSVy0ZMq6nx3tAahjcptY/gna+jqZ6iyV+gp68Nunrhq26g1RD/kxXHwQB7LdfooTWBZvT2etgaFbuzpwNrsMA4uvDSzHF3Xjd9o8MorGaozea7A9H/ulHJGyQAoAU7FDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=Pu1adiz25KCRpgRWl2WYLX8LfFnlYcauI0SeQ4hz+CpPbh2CLS+O8LwRnbAu7qDbzHsvVmA7Pn8uV7gTtbr+RZ4CSh+uqbjGNaJDTMnCeNwlGMdYTBiMqaxvEorAo4Ci2lm7MpPDObngfMidSc5yjj9FWWxbDvdUj3MscB0X1IE=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:09:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:09:04 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 7/7] arm-autonomy: Create xenguest-nodisk-image recipe
Date: Thu,  2 Apr 2020 18:08:16 +0100
Message-Id: <20200402170816.8818-8-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:09:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd13808a-28c9-4f86-8ccb-08d7d728904c
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|AM5PR0801MB1618:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1618D0EBE67FD545AE11B9109DC60@AM5PR0801MB1618.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RMTjvRljhxk8qYFaBuEv42C/oE479Ga6KRmt2ZhkKiguOgVB+tJwq2eL45qB6UV/jpZ2qLherdhY2A5W0zQz7YXCLEivMywCzG+zJQ8VYTdJgHFblLQp67kLplhDuQedyvFjXbFwTI9ZEB4dNrvFojKuhI6zDxVp1vB9P8lXQCibOsB+K4+KaQNUlqkmOJ2d0ZCgxVqRQ4I7yvOQADy5xpRfXcL8N/Q4PUOxGfMwvyFLJ+JcBx/5yQPKLCviGV1TkhTj+NM0EH4UiTIuthiypoVbixCemnfEE4iG+6rCIoc3Q1pGAR1lyJYY4QG79YQDTVjh/V0eODmq6zC5+f+jce4690a8N9vKxKiwk5qZRXG7h43bAlf7bztKgvIUE7ThmCViTNh+ryWbHbqPcKn17uyQKXkfVVD8NQpr+bnHs75QrIPzeepex8fFe6CunBxp
X-MS-Exchange-AntiSpam-MessageData: 
 dxqIPvKqGmLegNfdf4VxNrG1q39Au6Lt/HBI6WzWw5XUU4wgGd9qRCh5AUJawFkpfFkTInLHa1hbBnnSDCwmbu79J2A238E2fOO9iRe0lICH1VxIwwqm3FYFv396IZaLL24RMi3TR5mXjiKBXe70kg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(7696005)(478600001)(82740400003)(2616005)(336012)(2906002)(70586007)(70206006)(6486002)(44832011)(8936002)(26826003)(8676002)(956004)(4326008)(26005)(47076004)(36756003)(81156014)(186003)(356004)(5660300002)(6666004)(316002)(86362001)(1076003)(81166006)(6916009)(16526019)(36906005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	44f40215-b54e-42c4-e7d9-08d7d7288bc4
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jNt+E4A3qHl8iiitkCe06+ULDwKB5FIxwI3Z6gY4PTG4TuW0R+Cipd96oiDtPI3VDbat7l5hmqdAhIu0GfmNfIu0rvBHxasqdoly5rSG7eqCr56Ezdqk2Qb5OiyZHMHz0WFQWsP85gz6lx+jZxcX0I32VETiILA80vshjeKSk1nyrYnMCg/HbMBS30Aq232J0CJ+8cW50aPBGB2c558SfTxPHv2pJcuK1wXmp1353Dh+GY4+oCY92O1kqql3sNNnOfqWk6lECSzs9xiIMZmmxMUctwcQTuG//yp5PqJOzzVTKU6r7EqG93ZTjOEcNHx8RB407QKZJgO25/CJ5HQDdurs+Cvya1LQ3mxdKTJFVvZno+fTxG8mBZ7MYUZZPLGD3wZawjDLEZpN6bo7yCybm8JAB4u4P+qUuTYVvGeoymiT9Sxmr6Llab9c56uczvtJTWzjKMrhdKe0+Ok7y4befRFzCIPOE5KsWuFOY/OpWdKTXebfFaeRrw8pCbjSaKciF3xtobQmo5cw0Nw2yNdMPA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:09:11.5203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd13808a-28c9-4f86-8ccb-08d7d728904c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1618
Content-Type: text/plain

Create a xenguest-nodisk-image recipe to be used when wanting to create
a xenguest image without packing in it a root filesystem generated by
Yocto.
This recipe can be used to use aio root filesystem from an external tar
file and just compile and take the linux kernel coming from Yocto.

To achieve this, the variable XENGUEST_IMAGE_SRC_URI_DISK_FILES should
be set to a SRC_URI compatible URL to the tar file and then call bitbake
xenguest-nodisk-image.

Change-Id: I1a8d80b89930f3bb6bcce40a55b4dfce9b5331ef
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../xenguest/xenguest-nodisk-image.bb         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
new file mode 100644
index 0000000..b2dbbe9
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
@@ -0,0 +1,38 @@
+# Create a xenguest image with kernel but no rootfs or an external rootfs
+DESCRIPTION = "Xenguest No Disk Image"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${WORKDIR}"
+
+inherit deploy xenguest-image
+
+# Name of the file we create in deploy
+XENGUEST_IMAGE_NODISK_DEPLOY = "xenguest-nodisk-image.xenguest"
+
+# use a local copy to pack all together
+XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+do_deploy() {
+    xenguest_image_clone
+
+    # Add kernel to the image
+    if [ -n "${XENGUEST_IMAGE_KERNEL}" ]; then
+        call_xenguest_mkimage partial \
+            --xen-kernel=${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}
+    fi
+
+    # Pack and deploy the final image
+    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY}
+    call_xenguest_mkimage pack ${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY}
+}
+do_deploy[depends] += "virtual/kernel:do_deploy"
+do_deploy[depends] += "xenguest-base-image:do_deploy"
+
+addtask deploy before do_build after do_install
+
-- 
2.17.1


Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web11.8716.1585306382040126308
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xgmA/um+;
 spf=pass (domain: arm.com, ip: 40.107.20.63, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=xgmA/um+lJ/eGswuJ2eSDMBYe/U9uAgQMQWkxVXr/fTBa0ZnFPdILNezW3ksha3fRIUPDg8YjSdpXke7VdfXfzgFxmCAt9/Q16aUp/rFf4xqD8c4r2PNNBm5Usb+gTAu5B83jd2WlHk/raO5MRpvsN/r5CQnz5wdZiG6hZo+1KI=
Received: from DB6PR0301CA0011.eurprd03.prod.outlook.com (2603:10a6:4:3e::21)
 by AM4PR0802MB2212.eurprd08.prod.outlook.com (2603:10a6:200:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:52:59 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::1b) by DB6PR0301CA0011.outlook.office365.com
 (2603:10a6:4:3e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 10:52:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:59 +0000
Received: ("Tessian outbound 6835489d965f:v48"); Fri, 27 Mar 2020 10:52:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62be483bb1abe80b
X-CR-MTA-TID: 64aa7808
Received: from 46b4bd2dc1da.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7733432-E888-4457-9A82-94DF304C22FA.1;
	Fri, 27 Mar 2020 10:52:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46b4bd2dc1da.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isjMuDfLj/Ef2sYnbEYTWjUEMAuYofSdNfd0RsWSHmwWwIrb3wakT+IOBRA+zy4wy7ZM8EWBD8lI7qY/jfEoV0ROwVswe7jfOSLlRDFiJQM1bNZdztHL3trrrPl/2JmCeqLwOrMyzyGnFZnMl5ysEIqLxX2Vuv1elFnH5Bx/SNGXfn3nC+IaE2K80EL1snp7dE+NTwvTanzUleCHRv7dTAEp6svwEpKD2Z+52yuP4fru8bZuxMYXpskCSB+Rdz/bnEEnvllaNGDWpTTaXeImZzDVCPvrq8uq1vafTuRC24BKRkh3UYW5QJFYcsU3WIR81hj15GbttdcawrWhugJFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=fosMDY5zLy6/tPuys6wog1J06jg82sCirAAjOLt9Z1CiLrpvT3qsDbnd45e0BAm6K6pf2K4wxVPTZnwBc2xb/YyeuZ5KeeWe38MAQPfHrmp+Ryh3lk2ZsDxFHlOczlGDNUhFIrhtY6AuQlO1eH2JCMZgJ5b0MT6uN7ZmrMhiYjBuwNP2acbSnPUm4bkI1Rs2KJNRHbIs85so73gcfsmzIny2DR5QFYEj8mS474tR115oBvoS1I5k2SYS6xFwG4EDvD/Z0YPH7G81SVjPbYtleOSNZg6f6onOjjg+ZYbRGWZpBnUrJMjBMmtTOq2H2IqeffsE5FrTaztFM+JNddrfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX5JlzFQrOXO4RCKsGjGXquE/7OOvDxBIf3MqUvjAaw=;
 b=xgmA/um+lJ/eGswuJ2eSDMBYe/U9uAgQMQWkxVXr/fTBa0ZnFPdILNezW3ksha3fRIUPDg8YjSdpXke7VdfXfzgFxmCAt9/Q16aUp/rFf4xqD8c4r2PNNBm5Usb+gTAu5B83jd2WlHk/raO5MRpvsN/r5CQnz5wdZiG6hZo+1KI=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3276.eurprd08.prod.outlook.com (52.135.128.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:53 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:53 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 7/7] arm-autonomy: Create xenguest-nodisk-image recipe
Date: Fri, 27 Mar 2020 10:52:23 +0000
Message-Id: <20200327105223.460-8-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105223.460-1-bertrand.marquis@arm.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19917ade-5629-4616-4a06-08d7d23d03e0
X-MS-TrafficTypeDiagnostic: DB7PR08MB3276:|AM4PR0802MB2212:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2212FC04F951161AD73FAAB29DCC0@AM4PR0802MB2212.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(2616005)(44832011)(4326008)(956004)(52116002)(86362001)(8936002)(7696005)(8676002)(81166006)(478600001)(66476007)(81156014)(1076003)(316002)(6916009)(36756003)(6666004)(66946007)(66556008)(16526019)(6486002)(186003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1eJ5oHS6olHwvlwYOmIQiJ+EAwN3FfsNcVn98waNqfYyD8OWcUYFFhim6jQTMoHbSOZk1KPVFBHeHvL6IL+y2FFVXzNbOhI8mCDay2pr5nJonivG8vXMb13116qtvlRa0bVtP0V7UIPIrCVq1ZQXm3XXUR4mrd3CZCsuuhqio2kF2yeKtFSby1YP7ceyOuKOaUhL1HUIinmmHnRu0hv5kGkr6aOKWATPhJMbbB+d8RGv+iaFeTkWc4gp8sy6fLSlq2uDQGSWZZAgz73+KAZso8AMekhIlL0iAgPJ7LPbI9601cHCB8N1aP1zpb3GN+dFK144ltLlZuHDNJa40SpNRzHSL2gPMQGrlnXdUyGylVywMbKa3+RV+OjUxH3bcuAz1CFqyD/nU7+HYtbTH25O4dtZl9YkRVvFlvj/1X3ERMZTn07rUKUCVqDDpbDzB/6Q
X-MS-Exchange-AntiSpam-MessageData: 
 /6Yx98+nxZ3usQ5ZDQzGvxdUrOA1eCb2BiOOO6Dx0z+I/wuTjwxEsWJ/5LyTMr4amXxSs1aWz9UnY3ppLy7Y5vPryPU8ku8VAP1hucMgy8xOm/vfkY4lX5LafWxpB0i3yy/NGbBbibXTMHRNJN8AEw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3276
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(86362001)(316002)(36756003)(5660300002)(4326008)(44832011)(6666004)(336012)(81156014)(16526019)(8936002)(6916009)(81166006)(186003)(2906002)(956004)(2616005)(356004)(26005)(8676002)(478600001)(70206006)(26826003)(70586007)(1076003)(7696005)(47076004)(6486002)(82740400003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2107a796-fcff-4820-0314-08d7d23d002a
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ELXNV0spfEHpt+MmVLvu2VBpNqLQlzK9yEsy3wmIFoNcVg8MrRHBwyUxyguy4eOsrw/LNhS5flxklORepp5OZyd37CGeGPEw40Adj2D9BjvBL9UMaT5Ygdscf4nrnYudZ4Fzpto+KfztYdbJ3lZwVpPzTqUjhwJ/KCJnVL1W7EKJz9b1wZAShKaRflWpqdsRu26R22ngsX6yReABaKfV5audQNg/CZJ2GyyTtJANgw/w0MwLBGsPOE9rtDD5fmfDDF9CmMJ8+dC4OoMA8H3jgVmDv+nW3cmYGyJHbdPdD6kjCwpBWXIiM/hk1nGYIuvfAyjvBJAtqvJhquB6GdJoRMP3SPI94XXBfbfugRTpDyiiwVKaSp/SAoyRMiS2etDkTpJanYdr1ETDyhbB7vDal7QweB3V7LECt6Sf8Z4IqpGjpvRMzl6phlaoMx5rycpqyYFD7YFR66SFwFU+joIqssDIhE3Qv5xYqAOTOs2MA7LhJBenpg1pUQLtoVLnXb7gZpi1bW7Lin67bE3cNrszGg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:59.6013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19917ade-5629-4616-4a06-08d7d23d03e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2212
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


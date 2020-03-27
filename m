Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.53])
 by mx.groups.io with SMTP id smtpd.web12.8837.1585306254229659550
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g2EKN21j;
 spf=pass (domain: arm.com, ip: 40.107.6.53, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l70wfUXFOolzr5wF8aUKhequBnVbiWe7EP2g4a3Ffa0=;
 b=g2EKN21jj8Z07BN8lowim6xxeJ99kmQJJ0XGlbI21pYKO0z5F30GIGUCV9NqTbCd7UDkqCHvOqo/3anFwIuYRCAoJ3QRV9BYeySVHzYm/Vo6frKU/54R4kgsq9rS5UER83w80/petEbkWeAvr5iVWKXJh2HHj4S742sevCRR97o=
Received: from DB8PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:10:be::45)
 by DB6PR08MB2757.eurprd08.prod.outlook.com (2603:10a6:6:18::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 10:50:52 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::a5) by DB8PR03CA0032.outlook.office365.com
 (2603:10a6:10:be::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:52 +0000
Received: ("Tessian outbound 8f06d475fc37:v48"); Fri, 27 Mar 2020 10:50:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e2cc1fb8b8e1edd
X-CR-MTA-TID: 64aa7808
Received: from 4c57ec5107d3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 188F3967-C2D6-49B2-A094-2C40B7125DEA.1;
	Fri, 27 Mar 2020 10:50:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c57ec5107d3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z66eCbOisEYhTXi0C4tyyow7KWjC3yRbCM7CzLWCOQBZbtyMDxnpFSjbxOuEojqao6HOe3O14NbQShRXVC3oxOve1wbQmSyIJT08KQgFrkgdBjMm9ROE4kN9qcarzvgohKQSVFo7rWRriRNQuBs1jGxUtn4y/Aa3ylxlJ9VahFVDn40GY4SAKE+yh+244oh2PH9zMrXcrQeOfemhSeIN3b6S6L703mTKoiLaZNSl3NCggs6fUnQrITEhMABMdtz8DZhhzWvBX/kdo7uxn9WYhG9h6jiZNxaABdUeQQo6UGkxkxxh3WrCo0OtUPqA/E2qvbaPa08uq9HlyNBZwd4QTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l70wfUXFOolzr5wF8aUKhequBnVbiWe7EP2g4a3Ffa0=;
 b=an3zfFxW6ly2KwcmwS7NRr9QX8Z5STxQVkZ5haeD59Ce6NiKtJMx3vwRQaViDKAQRpMtiQDGQfSEEk/Ysv5Asu92cG44ZMIFHYxpMKGuNv2eGiQY2QLXIUGjzQnIuKKm0KcWgQpwb2vNjLBG3qgd8UbBZYYe1uOGU0nUOb0Gcn6L3w3z92avlwJPS3vBS2cKihhQURvQO6881UWui7gKmIpYF7SS3Iw6kdycIpydqibahtjqYWnIhipd8jV8LpuzAYUikANTdToGDMMtslbgiQsFhNeosfj9aDqh+hFlH3g1qPMcL72OY0YJWRTytDMBT32RHCs3T24d4J5leZf0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l70wfUXFOolzr5wF8aUKhequBnVbiWe7EP2g4a3Ffa0=;
 b=g2EKN21jj8Z07BN8lowim6xxeJ99kmQJJ0XGlbI21pYKO0z5F30GIGUCV9NqTbCd7UDkqCHvOqo/3anFwIuYRCAoJ3QRV9BYeySVHzYm/Vo6frKU/54R4kgsq9rS5UER83w80/petEbkWeAvr5iVWKXJh2HHj4S742sevCRR97o=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:45 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com
Subject: [PATCH 3/7] arm-autonomy: Create arm-autonomy-host image
Date: Fri, 27 Mar 2020 10:50:06 +0000
Message-ID: <20200327105010.400-4-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:42 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afc75377-0542-46fe-cb36-08d7d23cb7ed
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|DB6PR08MB2757:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB27571468573DC374FF43220E9DCC0@DB6PR08MB2757.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vmq2qasaJiHH6uwDnVJLDvh8KsaZPSVonYzpR8TTjJndClrJGDtjVt+43OylNWCbC86EnURrZU4UJ8KGYvHCWw4wawn1c5F7KYHMxCTixBo0PeAZZEvgyfX0ic/ioUhkr0GlXFxZyXX2mZcVOfvUgTCjX4vlyyUJFApxp7A53nw+DEWyLkgyY3ICMqC4rDTlbLbvlgYsdxSSwJcVCvCPxehr1uw3zdGqCqTXQ7WefwgpFcPnpojXnP4r3TT1OFdF7hkhvlp4MWHJxMqAX99eI8k+fBNP3gMuoELoFLD0CoEBOQ9lgOlcJn/OwJlexD8nTQpnhxAXg7xaZLty2s6f14B6euxdMSzO5xK5/9v3eEtETSU9+SsM/UUBMWDfjcqCRAIamySicO3IEA9/e3Jk+TiAXI95nfsL7oqU+D2vH0ERJVztjIqNYynXnnoXCaf/nRfumuWutoLq08AwdO34Zf7JRtIuP6H3Q2838LS+J62BrhxZbiDAHccsi5Iwz06dKhWZDnGFUIq7eEHpe02HIWttd/MQo7j6h0dOBLw+wzj4YCbyKin5MgjZLiLURlu4pLuECw9ggnT9e4DHQdrzlbuIzkLKYadR2eYXw5iQEMyqbT2p7V3M2vG6cLh2ak+DfVwlFPcMduxbFZ1h+MG0IQ==
X-MS-Exchange-AntiSpam-MessageData: jboZiovR+0eOp066JBVvycxZOrOGiXmERxS9ypmK71rxj9Dd6YtQhxRi9mXd9OWPZ5eG0R0bN1ORiCADf3GHmPhN/1EsAxHLodXyEQ5cY8Qnbx3wiyMQDp+ITE/HnHgciczcpUWdr3baRfsD+NwqxA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(36756003)(86362001)(6666004)(6486002)(5660300002)(356004)(4326008)(336012)(44832011)(47076004)(82740400003)(2616005)(956004)(16526019)(8676002)(7696005)(81156014)(26005)(478600001)(316002)(1076003)(70586007)(26826003)(2906002)(8936002)(6916009)(81166006)(186003)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2e7bc1ec-0c66-43af-b279-08d7d23cb2cd
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y49pSXfQs+9ubvnfkUWn+EkENzvNAjMjktX/fWUJRo6q6YkCgO+BBqjGT6pBdSL/55BU/4iBC/BLv7U2yYwn5p/CgBwQmoKhSK/MhuqC205/7QiZUylkjqtIdWtS0VUCxVq4pN83SdoeH8dRlee4XjeY90pZYgAWszAs6uibHXzJhkGGH++D7f7RFOJr/rISTMy/wB0r96q8wIpYzb1w5twEoem/ba3o//ADaXZ8WH5xrGJRl0qPewCNEA+r/ihqZj6JnGtg1M/jOLfQdyXEKd/adU9WqadU/BimW9knpqOBffNMF8tYqpsfTWJ1UR+zue1J9PuJxRo5+XM7KRtWrZRolMfrqGRlXYVIL9rHssVZLabWcpRirJeBh9bYtle2C9wur8g9jKRVf7Zc3HBDFi38GPVNsZI4Y9gzb4vjHTGtzuXPsCG10YEtcMHLrbZ9uUel+Oh5jBun51WeXeSm02QkW8bB0eUVGQLffukfJ9v28DJ7E7UvHLcIukDW5oiPXsW2noUGu29nhne4kd4sIMuuEytS6twmQLFUDlzYKg48oHkE/HteuqiyIz+A36k9uJQHya9rT5V5FXlJeTtckSdZEWFawUfOk6F0kmNv6DlEaxqx1LmLta7q37/JfNGpAyJf+fS3tE3EN/Vj9WZTEsSfFYzPPmEF1vyJS5c409jXq0p1k+THZg/vb2EFCRZLh4wXUX8lIEA4DYk2gIR9Ng==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:52.1829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc75377-0542-46fe-cb36-08d7d23cb7ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2757
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Create minimal image suitable for an arm-autonomy-host containing:
- the boot packagegroup
- the ssh server packagegroup
- xen base tools
- qemu (required to start xen guests)

Change-Id: If864fc6b768cbe4ca19bfe24753c008146b7550c
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |  5 ++++
 .../images/arm-autonomy-host-image-minimal.bb | 27 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-core/images/arm-autonomy-host=
-image-minimal.bb

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 1f80a05..d0c6181 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -40,6 +40,11 @@ Images
 ------
 This layer is adding the following images:
=20
+* arm-autonomy-host-image-minimal: this image includes all elements requir=
ed
+  to create a minimal arm-autonomy-host system. This includes xen and tool=
s to
+  manage xen guests. This image depends on 'arm-autonomy-host' distributio=
n
+  feature.
+
 Recipes and classes
 -------------------
 This layer is adding the following recipes and classes:
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb
new file mode 100644
index 0000000..fb0a0b7
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
@@ -0,0 +1,27 @@
+# Recipe to create a minimal Arm Autonomy stack host image
+
+DESCRIPTION =3D "Arm Autonomy stack host minimal image"
+
+inherit core-image
+
+LICENSE =3D "MIT"
+
+#=C2=A0Includes minimal set required to start and manage guest. The xen sp=
ecific
+# modules are not explicitly included as they are built as part of the ker=
nel
+# image for performance reasons. Includes all kernel modules anyway as it =
makes
+# life easier and does not cost that much in size.
+IMAGE_INSTALL +=3D " \
+    packagegroup-core-boot \
+    packagegroup-core-ssh-openssh \
+    kernel-modules \
+    xen-base \
+    qemu \
+    "
+
+python __anonymous() {
+    if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, Tr=
ue, d):
+        raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-a=
utonomy-host'")
+
+    if bb.utils.contains('DISTRO_FEATURES', 'xen', False, True, d):
+        raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'xen'"=
)
+}
--=20
2.17.1


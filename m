Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web12.11917.1589203777956059920
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HJXvJxqb;
 spf=pass (domain: arm.com, ip: 40.107.15.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0P0c/oVVt79EcDjQMuzGj2egz5e4JswI2BxQSz1xmk=;
 b=HJXvJxqbvrCy6B9OORx7tfVGuZVGIDsIoZQo0Z1Aq/efL8NnjfTguT59hy0U5VqJP/6hDZ178vCZwaXPRM6eKLsQFocCYLKX0f9Ji1VwxNjeVndlE4M0Q99+qwnZSRb30FWm5R6HAdKK7Tof/3znTa3qQ5Y74tmHZksEZeV2J6Y=
Received: from MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13) by
 VI1PR0802MB2623.eurprd08.prod.outlook.com (2603:10a6:800:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Mon, 11 May
 2020 13:29:34 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::98) by MR2P264CA0025.outlook.office365.com
 (2603:10a6:500::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Mon, 11 May 2020 13:29:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:29:33 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Mon, 11 May 2020 13:29:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 584b6e94175487fb
X-CR-MTA-TID: 64aa7808
Received: from 8f817830c3bd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F93276F1-9EFB-49E4-A157-98C67384E6CC.1;
	Mon, 11 May 2020 13:29:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f817830c3bd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNU+L/eTJBlzVMv7RshCNaF/WtkvUAcSZ202PHxO4bkExIKpHzx7EAY4x+qxxgTX/QSLf6xUlz6LKmQZwLxiraLVr+VdEJM0kLoQyUNkSxyWb5Wh0TvSJsfJW7OOvhiOrlZVlRwbfY7WLdmfczQ0IbmZpzJk7/rBGrYwuttw9cvZbstbsQcHDDFrKzfP6Qk2e7Ci16AicNCwyr0ED+lJw6q0pMGY2PlQaLG3/8Ww0LQCJNd8011jBhAJfRVIm6AzeaK5QS8qJSgZYYii9CjDM1NSPTwHEXVb4lUs7L2dyT8nHfrU4pzrbFaXIUCk+VeslInZx7M0QergbvS9nPLQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0P0c/oVVt79EcDjQMuzGj2egz5e4JswI2BxQSz1xmk=;
 b=Okom76pqk+NSJ1oDgZ6eBU2/POE0SQDYFik2UlSjt3RR8tyl2Dcsu9TtiV23zfIsFn0QG0KoJL26TMHver0UJfkKgGnOZEjoqja5ikGf4vF6u5fP/XLUAH/YNiqLTfHGxryRLTLu1jMlomZwO74xaDQ+7GPvGDEM+mGChRHUo7zVn8GtOzR0NPFetozkZnACgisqRqHMlyxDMMzPWrl39OOMA8Yc2CiyqGIeN95P8JTm8n9/5/1rnEw5Ir1BuTbFWrqEU+3XJnXUHE3TGyA3V1LWoTjEblSlze/RgSaZn2bfX3CH/ZlgZFTAvgUQt3XIIwPfN3iqKvKGD2B54QuZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0P0c/oVVt79EcDjQMuzGj2egz5e4JswI2BxQSz1xmk=;
 b=HJXvJxqbvrCy6B9OORx7tfVGuZVGIDsIoZQo0Z1Aq/efL8NnjfTguT59hy0U5VqJP/6hDZ178vCZwaXPRM6eKLsQFocCYLKX0f9Ji1VwxNjeVndlE4M0Q99+qwnZSRb30FWm5R6HAdKK7Tof/3znTa3qQ5Y74tmHZksEZeV2J6Y=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4004.eurprd08.prod.outlook.com (2603:10a6:208:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Mon, 11 May
 2020 13:29:26 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:29:26 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-autonomy: xenguest-mgr: Add support for compressed partition images
Date: Mon, 11 May 2020 14:29:26 +0100
Message-Id: <1589203766-65846-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::35) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:29:26 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0287879-2a53-4828-7832-08d7f5af57fe
X-MS-TrafficTypeDiagnostic: AM0PR08MB4004:|AM0PR08MB4004:|VI1PR0802MB2623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB262319B94343D5425A30E4AC92A10@VI1PR0802MB2623.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pEcT+BDdKZkYNMybnbNZrBan2FElPYFLdYU/+tos928Z8aEwV0QW8RCHQrENwpwMAl7RHPd4LVvz2K3JSUXdVvgsWoQ+47rfIAcIr7aJrWq4OMq+C+BllQLgnUy2AiPPDQtcJob3EeEkomz4OLpzPgfCBSEYA5N5ZpCxBozmC/A5mPePW7YSYcorQR8FBwPw2YZ05R2yGSAfEDygfqkV0+dh/ZIO2pHAVI9btP9BVQkPik7kQTF+IsSNLI5LuQpntlwpqWlp/Wr0YlsrXnb1S+DxXKIjAlw8uLlFJB/knI3gjJvXWZBJDCxh3rEPfCtw97PTYYSrDocnlQbI9NAklWqEKeQULptxvwn8zSD1gjvCZpqxIPrcQ9HvjjoNZTUavAeHNSrzIp0q+axS4suTd+WKXj2CuyxyfAuRHRI5BhbdayZmxJSjPIKA9509WZe2z26pD4mMIVbLuloCOjc3mCDHJxQVDQsJ3hJQn9/WSccCF/uITzY7lnOQsl4KlgbIE5iQJ/y6QEsHHPLPmEkzxg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(33430700001)(66946007)(8676002)(316002)(8936002)(5660300002)(26005)(16526019)(186003)(52116002)(4326008)(7696005)(478600001)(36756003)(33440700001)(2616005)(956004)(2906002)(6486002)(66556008)(66476007)(86362001)(44832011)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 tTp+G9ovcefKFmfjHBM61I71PDEsJDr5Bf0ngf6Ht2MttjM25Ruzri6edD3sA0ugOX5nldCVgopKZM1KX5slVDJTFUIgunOAuOTwnlEv5I/X5QjlUYuVJj0fewf5ygaHzDi4We95z3UJ0lpoyk7VV4ij4q+mm/0lC971GmW2SAvyQFF6FMkMbsY5vOYw7WngPimeFRoIiKcGB+Ilpow7YW1JeTtWdifvxHZ+5vssr631DMx02qQuRT5YBO4MLFtFwbri9ct+iqryPBClo5VxYkar8YPKiV+zZbYks5BnfOdsLWZiaI2Vi2N13VRRDU8PTjlsDLBFHFYVjNTGuri7eLSjRX9oflDZsw+vxrNw7jW3igsUuPJQ9QOK8UEcoaLbZrAPr4yLsZUZwgF84TbH6aXsyZUo7KFuy1vC4dzvXzwtpaT2U8nNAvplUMe67c+KOFcJyrq8jvKmmFnJIxEa8xSWnvDLvSrJ+eiW7nPPqSuC/DWxtRqjwXR4mkb7hbHm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4004
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(33430700001)(356005)(82310400002)(336012)(36756003)(26005)(5660300002)(16526019)(186003)(956004)(2616005)(478600001)(2906002)(44832011)(81166007)(6486002)(36906005)(316002)(33440700001)(47076004)(8676002)(70586007)(8936002)(7696005)(82740400003)(70206006)(86362001)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2fdb13fa-f838-46b8-307b-08d7f5af538b
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ozkfZ3RDwG7m+siW2+WvtNk6Sm2RDIr8fuJdvG1YDApjN+VqY7vHI1021QVfN1N4WyiRWU9OF6AKK0kr3UCawMuYkckMFVfIa7HTr+awA8/2vqP0xckDm6DLKJO2uI/jez5tu3TT0XQJ8IrAhNF5vL9LjrxpAuaLRbXHYQiTWTJpevpLm/CYECiC9g4+kyhbaXuUCkBtBJqnnwmP24Oa7aOdpg+N5hPrrxhthj0GyU0d+kBw6iCHZZqP0kzJIuT2qokz/Q1GO/wqSlcELKUZFfLFfnEymQynZd6U5p5LZA4EYTnn3qUjqvLcxMqTdoIG07EsrXiyLvnPmBOoIfgSO8/u8nUAh9DgT+RUBEjLKBj8T7fFAkvFOuC5kD6qE+jSFgPF9Q3V8FXXlaglLslAfHdiX7KsYyf/8OAwrnW9iVz2kdrzOE0Bx0+TgzYJIgGK1emK68Pfzio3lyE3bTqp9M+4AblFsNoG98MIVtBz6XC8OL5VzX375g6r+kL51+bcuIv8AIFkPFY+cqpzV/wjL6CKJlPmMaHch0eaj/Re4rxOb7xq4G/yNd7LhkCHeUZv4Ncp1S5XVtngwgEZV/aSA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:29:33.9508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0287879-2a53-4828-7832-08d7f5af57fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2623
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

xenguest-manager now can create guest partition
using compressed images like *.img.gz or *.img.bz2.

Change-Id: Ifaec0b7c301b2b316ebccdd0ca85083262f2714c
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../documentation/xenguest-mkimage.md              |  2 +-
 .../xenguest/files/xenguest-manager                | 24 +++++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
index d77fd48..3dcc28b 100644
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -62,7 +62,7 @@ The file contains the following entries:
 - `DISK_PARTX=SIZE:FS:CONTENT`: create a partition number X (1 to 4) with a
   size of SIZE GB, format it with filesystem FS (can be ext2, ext3, ext4, vfat
   or swap) and extract CONTENT as initial partition content
-  (.tar[.gz|.xz|.bz2] file or img file to be dumped in the partition). FS and
+  (.tar[.gz|.xz|.bz2] file or img[.gz|.bz2] file to be dumped in the partition). FS and
   CONTENT can be empty.
 
 The disk-files contain files to be used for initializing the disk partitions
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 4777054..99975a2 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -262,12 +262,30 @@ function xenguest_disk_init()
             fi
 
             case ${content} in
-                *.img)
+                *.img*)
+                    decompress=""
+                    case ${content} in
+                        *.img.gz)
+                            decompress='zcat'
+                            ;;
+                        *.img.bz2)
+                            decompress='bzcat'
+                            ;;
+                        *.img)
+                            decompress='cat'
+                            ;;
+                        *)
+                            # invalid/unknown compression type
+                            echo "${PREF} Invalid file format in disk ${content}"
+                            xenguest_detach_disk
+                            exit 1
+                            ;;
+                    esac
                     # dd into partition
                     echo "xenguest-mkimage extract-disk-file ${guestfile} " \
-                        "${content} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
+                        "${content} | ${decompress} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
                     xenguest-mkimage extract-disk-file ${guestfile} ${content} \
-                        | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
+                        | ${decompress} | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
                     if [ $? -ne 0 ]; then
                         echo "${PREF} Cannot populate partition ${part}"
                         xenguest_detach_disk
-- 
2.7.4


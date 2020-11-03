Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web12.4659.1604412746842588354
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 06:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7ElGFFFM;
 spf=pass (domain: arm.com, ip: 40.107.15.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svsYKp7YaV5pyeT+M85HEgGEKL7BMj8Exk7HyFTMN74=;
 b=7ElGFFFMwLAL49BJIZe+VALdKjEcELJsBheZrZX2Kh//RN9uZCFXMXOM21RIhFSLaIWBzFDSC6vr3T5ZQdCAfxqY+guBonZtVsButl1CgUTVB34ipejo2f2XZmclwpfqhCo9t3QzcMaOfOfC2DhNxlL6RACc2jYpLJGarU+kBbU=
Received: from MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::34)
 by VI1PR08MB2879.eurprd08.prod.outlook.com (2603:10a6:802:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:12:20 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::eb) by MRXP264CA0022.outlook.office365.com
 (2603:10a6:500:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 14:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 14:12:20 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Tue, 03 Nov 2020 14:12:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec8acb5372c5b9e5
X-CR-MTA-TID: 64aa7808
Received: from 29a22a801eab.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C114375F-3DA5-489B-AFF2-FD1B5E9DB18B.1;
	Tue, 03 Nov 2020 14:12:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29a22a801eab.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Nov 2020 14:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b97ozcSW42TlCbSVnOmaqWYYotewzFEOlliwdsIDDkVls/gW7ms5G2LLbwBzHA0vsnlglritaTPRztEVt0zaQVxag3ePGFJ44TK29vja4NzsCGirzo81stMedM/rWtHem8FkkK3IAnqNfI5oLZj1ECi3HDo06UhZ5lUAvwGE6qQ1oaeDL4OHnFIFLtUi7l0d9KIGbsA6O9n4229OFa8Fl7dmnj4m/BQWFCPQRb+Yr4Iu0nWglKWol3jJBUGRq6Gpn8wxfdYCkIUBF6LlrsAkb8yMgXYbloDSv9Wau5G5SJgce17CoRQGYOCdmeDcmp8E393e1IrkVuHwWyuK1iJWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svsYKp7YaV5pyeT+M85HEgGEKL7BMj8Exk7HyFTMN74=;
 b=ZskxFo3BwdAGpZHgJ+cshMEhp3O+yyCp3I8tzQCJCxstwi2MN3q8PnItiTKd7JvxqdzZ3ATEkTo3xu9EonFrB04pcLeW5mrjrmxXwPHw+XalZY8c6AQxGNYJCyXxYiv9Lre3lMjkTPx+upNojtfVdXdCRuuPeL8FqwQi3sLT2r35v9nB9KqP+diIuGV3EvkdSLatBYo3st/vDlEKalUCmtAtG5cbp3C0I4M/Nl8hnQp13G22QFL1J5c04b0OLiH2g5kpYHXQyUztRLi+a0RWKd36r29kt0Xn2NcccBiYKbuM1eBGhdUbLMK9+pRRr17g++y7/g//3rMjZUR8bNx61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svsYKp7YaV5pyeT+M85HEgGEKL7BMj8Exk7HyFTMN74=;
 b=7ElGFFFMwLAL49BJIZe+VALdKjEcELJsBheZrZX2Kh//RN9uZCFXMXOM21RIhFSLaIWBzFDSC6vr3T5ZQdCAfxqY+guBonZtVsButl1CgUTVB34ipejo2f2XZmclwpfqhCo9t3QzcMaOfOfC2DhNxlL6RACc2jYpLJGarU+kBbU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2997.eurprd08.prod.outlook.com (2603:10a6:209:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:12:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:12:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/4] arm-bsp/linux-linaro-arm: require linux-yocto.inc
Date: Tue,  3 Nov 2020 14:11:42 +0000
Message-Id: <423fff51dc4c4c8015c598023614c20d4e42ee11.1604412597.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
References: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 14:12:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f42d9f96-6c06-4a69-15e8-08d880027a47
X-MS-TrafficTypeDiagnostic: AM6PR08MB2997:|VI1PR08MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB28798B7E20A2756F3823BEBA92110@VI1PR08MB2879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O3tc1QnZtshcHdkZufGq8N+kjnWLHzL/WgA4UEMI2XY1JO6Ll8Rmcf9tp4VkseDERaK5eoH/w54hA0TlexymhQhuo72WYA2QeZJMP3bGcmhy6lHULy/uREKlXpkFvmTCLSisY2jfHiSOF5TP9a3e3V/4YMM4C7XMkG98TB27YxT6M6IFU6dyaXfu8UZUH09Xwu6+SIcOoSU8i/Y9cpik0H0Qw96Jpq1Smf9KH8rNgDB6iAvBJPFzsDaZtTgdEgkgy/Y/CUPh6yxuu5Dn8Glgu4UNynY4h16SagelkQRhN7Tv6/1SvCN4VvZCp2gVJvfuJ9eEpsdCGCO6GO5vcSIkEA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39830400003)(66946007)(66556008)(186003)(26005)(16526019)(66476007)(2616005)(36756003)(5660300002)(44832011)(316002)(86362001)(7696005)(6916009)(6486002)(83380400001)(52116002)(4326008)(956004)(8676002)(8936002)(2906002)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Ry/LWz3I4A4hBm3xGyO+mrEyd/oLJFIoHrBLJ5CGrqFWxKCJWYYopsvD2b2n5SSlCIbUV+/6zEAFAwxI1e+dCYYIWWRjfwoyojeQIKVztjWPHQNnXUiIWnJIZKO7kqDQy2Na/flVKuziLfL/aAt3NWr++vMgLLb/HvRTcz3WuUsv0nxpzEWpBnoIUO/r14eyW2keNLwvvJGLzcEbdVGaOQcT1qvW+2uvLY772301zqQy0sxdDLX3mpbCAQa6xF72sGNgWEx4r3sBbGgR00YtRXL4mEVVWj9QUK2Ke11q9r3OY0S2DIUOV1GbEtWH23eN4zve84UkY65rgStXwdHrn0/f+rm6tDTWtagNOazpil2G2zzKOq1C2GAAaB7EBpE4aRfRqYpsiqQQ0wKNE5cjzVg2+K3nxuatziSZ7RMLKHBTxp3ASYgg7Jq39LZGw59GiQtoFqz5LXjpxT/08nYsd5iPeDXibH9BtvAOVvCkYMbfGvPc3F2PJ49eAFURLKDxu+bz1RKQeEgNX1w1JboL3UgIFd8YkwUxXUy3nKyrlHzj/6FH2sslwTK0afrhSzuzoPfEDfGOL4rb9VUg+g9UDlDgX4F/9DusGnEFOejnRD8dBhAH0581SuxjdS9trAhf3fCjH6hCHtOlKXN4qUbYCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d5b99db-785e-441d-f5da-08d8800273ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PvCwv18Iq1rQ9DxYe3QCPBW+efb5EbmV5ZeyV2+ZY1ztR5QlGfcVsQG/XqF6XE2H9W4s+EkKXHksP55bgLwMerNRPlTESTBrj/2NX4EIB41r/t3UgVfLHQr4ooq/a3gJ+wfJSDcFPZ1nSI91YvDFmmuXrtkixe/YC1fkIlOn1aNEPJ+y9lLAd8JhlQBOQDv7pkXc5zzFL28+Lxjm4k7VzHUFWntKRSJ5Y6XZVhJ0hTA439fJRJxPAS5vTu18lO1M4l3UhbvLIDMxOOC/8u/BmCLY7m/jhR+xuKKa3U39WPra8iqJViyAjzYfwazkhffvlWI38C57LNap7jH7en62Cs8xxvnfugVKBinRzZCvuHjLBwnrmafpwR4DW4nVvHos7qUJ+4k9NHoEpkq+bnANgg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(46966005)(2616005)(6916009)(26005)(8676002)(82310400003)(6486002)(83380400001)(956004)(5660300002)(7696005)(70586007)(70206006)(8936002)(36906005)(316002)(86362001)(44832011)(36756003)(4326008)(2906002)(478600001)(81166007)(6666004)(186003)(356005)(47076004)(82740400003)(336012)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:12:20.0665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42d9f96-6c06-4a69-15e8-08d880027a47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2879
Content-Type: text/plain

By requiring linux-yocto.inc we can have separate build dirs when building
LINUX_KERNEL_TYPE as 'standard' and 'preempt-rt', for example.

Change-Id: I6288d210f942d1bacd510397ef3d1f2858951e68
Issue-Id: SCM-1653
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
index 999f4e7..4859a66 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
@@ -8,6 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 inherit kernel
 inherit kernel-yocto
 
+# Require linux-yocto.inc in order to have separate build dirs when building
+# LINUX_KERNEL_TYPE as 'standard' and 'preempt-rt'
+require recipes-kernel/linux/linux-yocto.inc
+
 SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH} \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${KMETA_BRANCH};destsuffix=kernel-meta \
            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch"
-- 
2.7.4


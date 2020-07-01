Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.65])
 by mx.groups.io with SMTP id smtpd.web10.21533.1593609621511784540
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=R20YxSSj;
 spf=pass (domain: arm.com, ip: 40.107.0.65, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UhEwzSNIkLcABkg5cLf6tL+7YvxSBNLbbStGG9uZYs=;
 b=R20YxSSjc83o8Q0mzNNLcueDseeQCjXSPvQH5EqrEXhAXW366Vc0S8VwoKRXdeGyIDhG8dArHOXinnKjnwDc6SfZh8YfSghE/+3bkxfLjfkOd5DI8N95NLIg1oO/Oga5+OUZFgo/kffGZa9smCKAcGNISVVolsulOGC+HJYC27s=
Received: from AM5PR0101CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::20) by DB8PR08MB5353.eurprd08.prod.outlook.com
 (2603:10a6:10:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 13:20:19 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::c) by AM5PR0101CA0007.outlook.office365.com
 (2603:10a6:206:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:19 +0000
Received: ("Tessian outbound 2dd9eeca983c:v62"); Wed, 01 Jul 2020 13:20:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bda4e5e7a9a2efdc
X-CR-MTA-TID: 64aa7808
Received: from 560f993f5d63.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63269FBC-693F-4EA5-9951-159A2ED29E24.1;
	Wed, 01 Jul 2020 13:20:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 560f993f5d63.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDb7I/r4PirmJ4VcOGvIZlnEWgyjZT/l2YHSndDWNCsmQfGhAYoPtkuZkhmtmUAQr7a2+l6luKMy/MzeMLEVh8Lk4Mp3fHXKNNVeT7D3R1rL/ZelimC1mRyPZVTd6yqID5+FpiynS+ckN39M6s1dUO+RkYegf7i7CoouXrNUR6Pbx2etimNrMJcNCyV+LZ4A8x/84lJ6aaM724yPeEYZUZUb5Q42ZKsly7U5HEcthSJyRmDPzu52LdySg5tlMAKWqpP78a38X6Ts4tl1OKCXPWkRUP6XCQ6osw3fvWgptdfqWYHcEG8x3tZ7jrs+g+ug///V+SWTYszHceCuchZuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UhEwzSNIkLcABkg5cLf6tL+7YvxSBNLbbStGG9uZYs=;
 b=XCturAM1QUxac86J1D9FNJF6SUPlj05zS+gapiARyYeWTCFc+GyEUTd1NdSh6y8aKuggM4O5S0DmNrreh8dMnIlmeSQ/1DE+7uXSQ0kVGYzpS4JiN8Xe6jjd07WZhJ6+abSanLoOn4nnreJalcNZUtL+ZwRad6Eg721OAISR21gLtCoKpjK7hlIhF6gNbpCoPNYZw//MbS1sYfUfkA3fgDi4gJpSDNHyBYTn4fuSSXoJlWrb06gXi5ote6w0KEWYmnyU5SlDtGocSWmozkf4MONh0Y5CN8ZAxCtKrnxKL0gHAglJgGmBZFEcAHmLMixYBLh0r+bgvq7I0vKE8P0q1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UhEwzSNIkLcABkg5cLf6tL+7YvxSBNLbbStGG9uZYs=;
 b=R20YxSSjc83o8Q0mzNNLcueDseeQCjXSPvQH5EqrEXhAXW366Vc0S8VwoKRXdeGyIDhG8dArHOXinnKjnwDc6SfZh8YfSghE/+3bkxfLjfkOd5DI8N95NLIg1oO/Oga5+OUZFgo/kffGZa9smCKAcGNISVVolsulOGC+HJYC27s=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:20:12 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:20:11 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 6/6] arm-bsp: musca_s1: Add machine
Date: Wed,  1 Jul 2020 15:19:40 +0200
Message-Id: <20200701131940.3084-7-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701131940.3084-1-gabor.abonyi@arm.com>
References: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:20:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4229f37b-57a1-4eda-86bc-08d81dc18086
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|DB8PR08MB5353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB53530C85EC7565520575F8B88E6C0@DB8PR08MB5353.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 B1mjGoIvmwWGPdCNEgQz8Nvff++jMn9Upc2KD+94ZUVsemazoKsEUAA2+EVks9+VceweQcdqnA2voOgflMByUjeQE0CfHUH/zlphQhiuNhnsu6Uva8l7dT2YFuX8orpj+T21bMCvW/wnDd2swY2tgMA1WXsaKyTg8+N/CbLE4CUfoRgrkBc7r71Kh79awBxJNQTTbRahSF7NY4O4ZtlPHxNuZTWKy8KjIUDfdHREVmEruySX8uUODWMImgx8a+EO2reWjS69Mp6PDE5YpwhHLIyQbXyzMj7Trwz2u+4cKLhfTaVdEkwIbjII0shxNX9RujagcQd9EIoygMn62giq1Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(83380400001)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 NZA2GtAKDLQbOezIX5OBeUPcgwxCLlhEt+4q59zPsPU2O5APIYJ596246Y45TZZTTKYwEvvR37sQdk5lX6z/0cawlOcmvY1bMK779iCWAuFix+CfVpiC6ITuZ7Dip1TX3QM1l7ad/YmKG0ioWIj4ju/YUy5Ph3hNltujLfu/J0LlXPlWLtGwO/AEHBwBrfNfcN3jSZwiO/solluM2MZLTr7+X7P7euvkC9sk+uAUlkYHGsZafBNchRYrhja7JbdPSR54H/oy5ipVDKWD/PXVPvpsE/oFILqq7EA321BgshFU5WPavZi0HI5lJ7OSOIq3AVRPJpL1qobhRRBYh8ii6lBoWN6bW9PTfcMlu0h+MIxd4X+qJrNoGCR4SxGDjNVMWZsnlsuLs/qjoEwCiiDHBLIQn+yNr20dkHppgadMVcBsiBzhxdH2Dp3vETxHhPP53uRHHS4gpoqtjp8AMJsEMRUU6yIuZm0a/5lAqsqRwXLaLq9CNw476hgTNUNqg346
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(2906002)(2616005)(82740400003)(356005)(6666004)(7696005)(82310400002)(47076004)(81166007)(8936002)(478600001)(8676002)(316002)(4326008)(36756003)(36906005)(336012)(186003)(70206006)(956004)(44832011)(16526019)(1076003)(6916009)(5660300002)(6486002)(83380400001)(26005)(70586007)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	745accc8-3b33-4b30-95bb-08d81dc17bd8
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hxl5CXHXMIUzDxAwaVUqP0PTf71PNu87bWilUe/bYPMUdobRevpZYXft/RlYJYrnKjeLW625BT/ClKavj8Odrxm2Gb8/bQLF+U7CLSlGCq/QKe82bXLAm+LC/dK92sA/+bxRgHeQLlCHEV0h8ZCSXHvg9SnnedYOTrntF0xqpSMd93oixo+ryCZnBtNr5ayQjMi82gnvZOUdoF8oBX4blyZHmUadeA/YTcdottlX+IobUJaXC+UeBRiWzqPT46RjyD9/Lnjb65r0MP73+/DjrFYFi0HK5JhsYRW0i4fVFlNqEXGPz/wJzMA/ExQ36r4P8fY/P2ESRDYpw3GWGlq1MafTNLa1bMVfzfThZ2Msfr5A3+RCDqDBzVyIAVXJzP2RDdAlZWVKvLtT26c3NCT+Yg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:19.4449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4229f37b-57a1-4eda-86bc-08d81dc18086
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5353
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add Musca S1 machine. Also add it to the supported targets
for Trusted Firmware M.

Change-Id: I58cee5f71d695e364b324b7c92db920b4b1a3b69
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm-bsp/conf/machine/musca_s1.conf               | 11 +++++++++++
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend  |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/conf/machine/musca_s1.conf

diff --git a/meta-arm-bsp/conf/machine/musca_s1.conf b/meta-arm-bsp/conf/ma=
chine/musca_s1.conf
new file mode 100644
index 0000000..4b6b575
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/musca_s1.conf
@@ -0,0 +1,11 @@
+# Configuration for Musca-S1 development board
+
+#@TYPE: Machine
+#@NAME: Musca-S1 machine
+#@DESCRIPTION: Machine configuration for Musca-S1
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
+
+PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
+
+require armv8m.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m_%.bbappend
index f86e2b1..32b50b7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbap=
pend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbap=
pend
@@ -1,2 +1,4 @@
-COMPATIBLE_MACHINE =3D "musca_b1"
+COMPATIBLE_MACHINE =3D "musca_b1|musca_s1"
+
 TFM_PLATFORM_musca_b1 =3D "MUSCA_B1"
+TFM_PLATFORM_musca_s1 =3D "MUSCA_S1"
--=20
2.17.1


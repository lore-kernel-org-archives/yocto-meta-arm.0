Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAABBC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:44:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.48])
 by mx.groups.io with SMTP id smtpd.web11.13982.1676465058381900771
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wgtnCfBV;
 spf=pass (domain: arm.com, ip: 40.107.6.48, mailfrom: gowtham.sureshkumar@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy6dCZQckRW6Y+8BRi2RupqYVd0a1q+y89NHR/cN6xo=;
 b=wgtnCfBVv8Rsrl/vZMUrUUILfrEzPwQ+bxapeMyNSbPX3nV5odwJjAbi94kAt5+zI6uFG6FQgYUnbp1hw1TvidIqS9CcnMrNpw3+qAzZmNpGr6rAjOFxgwhNEFVgI0t26BICFQsKCG3lJrv7Nz9SGfknnuGjoSxDzAXlubqG7E8=
Received: from DB6PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:4:91::18)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:44:14 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::b) by DB6PR0402CA0008.outlook.office365.com
 (2603:10a6:4:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Wed, 15 Feb 2023 12:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.12 via Frontend Transport; Wed, 15 Feb 2023 12:44:14 +0000
Received: ("Tessian outbound 3ad958cd7492:v132"); Wed, 15 Feb 2023 12:44:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d64dc708a85a25cc
X-CR-MTA-TID: 64aa7808
Received: from c2e76f156d33.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D5B89836-DC8C-4C95-963B-69294F45CBA6.1;
	Wed, 15 Feb 2023 12:44:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2e76f156d33.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Feb 2023 12:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pep57floRrgf8UZ1hym1s8AZ55kIsuSDCu5YGwr0qbY2Ys3HIKmPbt7TlpfFw66i8TbA4JOSVwBNMfq9+q+B7kjRtmChLUgUx9c4HaFfKLKNgfvCUcyaL0IoVl4uObUp2+xWzI8cR6+5/XpcT1ObhUmzZ/fYH0I3XAe3j+sTBPF3GMwUFj62LcYXL5n5W+I+52K9SzkWTU0B1tJmUtf7R02se+qWp6eGkpGuyLEpA5I+mATo2vdtDpdmmDr17HAybCr9O/BpYEAYhIFJmmS4k0hB41JeLh+Kip6hCgvcP6NfJOsvUOM3d2hUXXJnyu88QSJhw1pT61iD1OrVQe4B2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy6dCZQckRW6Y+8BRi2RupqYVd0a1q+y89NHR/cN6xo=;
 b=lOae0iSOsTrc9PCauspWBL9BrV1oPaPzndfIYSQY/ym9J7FdxT7XUpy2xg/ttvA2bcpiSMyeqDIvXYX68zW2ql4r5+IrP/+wsGtQiy6OWcViAUACsUkNtSvjinEn6E8y46X44uoDHsuj9Dv3ynZlodKK9hIw4nLBn0IQy/lz5YYpYZrFyIN4Jnurc1/+C0jksdHnLMqM2NFxiz8bIl9860Z2wp1Zuor8XD6zIryVpYuIAakohvNmL+QC6zWNrVJmkc2qiol+JjJF+mjCA0KmMr2xN2P73+n2LFxyVy4BO283HvEi09e5qIDnXoZ72xdLC0Ga4JDE//tTxODjopfv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy6dCZQckRW6Y+8BRi2RupqYVd0a1q+y89NHR/cN6xo=;
 b=wgtnCfBVv8Rsrl/vZMUrUUILfrEzPwQ+bxapeMyNSbPX3nV5odwJjAbi94kAt5+zI6uFG6FQgYUnbp1hw1TvidIqS9CcnMrNpw3+qAzZmNpGr6rAjOFxgwhNEFVgI0t26BICFQsKCG3lJrv7Nz9SGfknnuGjoSxDzAXlubqG7E8=
Received: from AS8PR08MB7173.eurprd08.prod.outlook.com (2603:10a6:20b:404::8)
 by AS8PR08MB7911.eurprd08.prod.outlook.com (2603:10a6:20b:509::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:44:05 +0000
Received: from AS8PR08MB7173.eurprd08.prod.outlook.com
 ([fe80::47b7:1812:6dc:b508]) by AS8PR08MB7173.eurprd08.prod.outlook.com
 ([fe80::47b7:1812:6dc:b508%3]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 12:44:05 +0000
From: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/uefi_capsule: Use json file to
 pass capsule config
Thread-Topic: [meta-arm] [PATCH 2/2] arm-bsp/uefi_capsule: Use json file to
 pass capsule config
Thread-Index: AQHZQSpHZ5bbprop6ECbMrZ2ILnus67P7jSAgAAFPQ4=
Date: Wed, 15 Feb 2023 12:44:05 +0000
Message-ID: 
 <AS8PR08MB7173457DC8CA031163EAB41AE0A39@AS8PR08MB7173.eurprd08.prod.outlook.com>
References: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
 <20230215104236.24484-3-gowtham.sureshkumar@arm.com>
 <CANPvuRkftB6dqw2cLtTCmKQQodEixDYwN7NbTCNfUmm0ZdA6yw@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkftB6dqw2cLtTCmKQQodEixDYwN7NbTCNfUmm0ZdA6yw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB7173:EE_|AS8PR08MB7911:EE_|DBAEUR03FT056:EE_|DU0PR08MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a62367-9e74-4c80-5022-08db0f5257f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xxUD3wuZ1lPPP8oWvF6JfQoZE0ZXtYGm2ZKGhG0tUxHo1McysT6D2F0F6dujrjJSSMf5uvbiXvn8dnZFNAFxhKAN/FuY/dr7ftXkcPndMU/FxylDGl21IrI0vafmwKY3TGzRodFPjkaWBlMyWsuxARaDK8Hg5AB61O/PiKxDlXyQA07DatBeWaz1YcDyZmORuFbIxPjBeGYlVIZwhYC7A5BIFL2QLyrfKwjRflC2bUpnkZEkBZbkSPJPVyUqjm2djn+0MUOOOylf1uGN25IATv7FIA7aFXrmYJX1IP+I1hROfSuOImLVHX8H6ZXIgYPNqE81vBVslBMSun1pkJxgCemqy/UlaJG+eS7OX4BO+XbLXNrlFYDStiqyX8qh45xZuZGwdprvLEOrndpnqd6abXbaXUq1/14D2rNrdXnsl9ekGj7hjr+43womcTLkClD1UOgrGJ01PEwh/0MNZchjX5JNRGOOdIlG6KIANgyEu+wOrCyCnRhDrFnnIeUtUQP0oTYrA3cblH22r3MFvVOX5qEpcJZMZ7crbsQwtVojNRmpDXpLjAhDsCWkuxlefI/gZfR38rmuWi1dJ8Zhd2gWi+b+dzEU1L+jzxq9r9Za1Dxm08BByvuZdtxheJYnZq4P7fwe5ARhyWW8m3vBTTq6vdpMe/O3dZpkOLX3Q/9kpQ1Mgda9bVk5TP9HFDrW2UtF
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7173.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199018)(54906003)(33656002)(55016003)(966005)(83380400001)(478600001)(71200400001)(7696005)(6506007)(53546011)(9686003)(186003)(26005)(38100700002)(166002)(41300700001)(5660300002)(8936002)(86362001)(52536014)(38070700005)(19627405001)(316002)(76116006)(66476007)(66556008)(2906002)(66899018)(66946007)(66446008)(64756008)(4326008)(6916009)(8676002)(91956017)(122000001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7173457DC8CA031163EAB41AE0A39AS8PR08MB7173eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7911
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9523eb96-b84f-411b-769d-08db0f5252e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	73tPMVpLrvA9CibonvEsWcvx9IUAKRDVvo2l501c69kM/q2tipRKi9wLzv79KaQ/89N1ZV50xwN1QRwHiBQ1N1fgnZLTz+CGW9Lk2R2HmbVKfMW4/nHPbCOTvqu48l4vvNVgjL6ENy7dsLq2IazJMrQD1s4Xvwkvtl7arqc0LLNsEznnuN1XtyrxVnjHDk7WQ6FYMEI0sWMgTWIDcs6eHIF0GsI0z6RSqnCpiCuCb3BOqGj51rBP59t/PYR3vAfFBSZ6v/10MFoH+eEnvq94oYmRQfhPT4yfYzL5+qp4agTmGQn8hjFiyiMCyuH+qWHpiu06I25mYG9Ev7v2RjEjgJ8wjVQKEAisRYAWqnNbKjSSIWHA5j1Y9dYyv/6oZmotOa7FG5/aVuFSJOJiYkISJb1gkWgnfVxkT0IfJE31YGFtLBDnInx20jSs1PP5EiTcIJKL+XvKDMTwZh4u8+Kw4E6i3/8UrcFph1KBEQ8xVwBhUjsKsp1GQYd9039T0QYvlQUw7GVl9V19DWE8B3cqCH91Z9qwMFQgthHD45IUROS4Y5atdbi2Wna9gl03h5vKLKk0wG40Gv2WICzx6Xw5qhSCM8n0qSg2h422rxo2oDoO0nHJLwcrpD+rvpb1kyiewkpDikOe0jwXlLSLeub6M2KAmkYrVbbiut9IkR1e98YM+xGcqAdtaU3m0mQBMvHE
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(2906002)(47076005)(336012)(166002)(356005)(83380400001)(36860700001)(82740400003)(81166007)(40460700003)(70586007)(33656002)(70206006)(4326008)(54906003)(316002)(8676002)(5660300002)(6862004)(8936002)(30864003)(41300700001)(52536014)(55016003)(966005)(40480700001)(186003)(26005)(9686003)(86362001)(6506007)(53546011)(478600001)(7696005)(66899018)(82310400005)(19627405001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:44:14.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a62367-9e74-4c80-5022-08db0f5257f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4393

--_000_AS8PR08MB7173457DC8CA031163EAB41AE0A39AS8PR08MB7173eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Jose,

The  CAPSULE_IMGTYPE is used in the uefi_capsule.bbclass as shown below.

IMAGE_TYPEDEP:uefi_capsule:append =3D "${CAPSULE_IMGTYPE}"

Best regards,
Gowtham Suresh Kumar
________________________________
From: Jose Quaresma <quaresma.jose@gmail.com>
Sent: Wednesday, February 15, 2023 12:23 PM
To: Gowtham Suresh Kumar <Gowtham.SureshKumar@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ross=
 Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/uefi_capsule: Use json file to =
pass capsule config

Hi Gowtham,

Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com<mailto:gowtham.sureshkuma=
r@arm.com>> escreveu no dia quarta, 15/02/2023 =E0(s) 10:42:
From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com<mailto:gowtham.sure=
shkumar@arm.com>>

This patch uses the json config file for UEFI capsule generation
as this is efficient and easily scalable to generate multiple
capsules.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com<mailto:gow=
tham.sureshkumar@arm.com>>
---
 .../recipes-bsp/images/corstone1000-image.bb<http://corstone1000-image.bb>=
  |  8 +++---
 ...rstone1000-image-capsule-update-image.json | 11 ++++++++
 meta-arm/classes/uefi_capsule.bbclass         | 27 ++++++++++++-------
 3 files changed, 32 insertions(+), 14 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-imag=
e-capsule-update-image.json

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb<http://c=
orstone1000-image.bb> b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.=
bb<http://corstone1000-image.bb>
index b0a71bca..ce4df8a6 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb<http://corstone=
1000-image.bb>
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb<http://corstone=
1000-image.bb>
@@ -13,11 +13,9 @@ PACKAGE_INSTALL =3D ""

 IMAGE_FSTYPES +=3D "wic wic.nopt uefi_capsule"

-UEFI_FIRMWARE_BINARY =3D "corstone1000-image-${MACHINE}.wic.nopt"
-UEFI_FIRMWARE_VERSION =3D "5"
-UEFI_FIRMWARE_LSV =3D "0"
-UEFI_FIRMWARE_GUID =3D "e2bb9c06-70e9-4b14-97a3-5a7913176e3f"
-UEFI_FIRMWARE_UPDATE_INDEX =3D "0"
+UEFI_FIRMWARE_BINARY =3D "${PN}-${MACHINE}.wic.nopt"
+UEFI_CAPSULE_CONFIG =3D "${THISDIR}/files/${PN}-capsule-update-image.json"
+CAPSULE_IMGTYPE =3D "wic.nopt"

Looks like this variable is not used anywhere.

Jose


 do_sign_images() {
     # Sign TF-A BL2
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsu=
le-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-i=
mage-capsule-update-image.json
new file mode 100644
index 00000000..0f011ff7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-upda=
te-image.json
@@ -0,0 +1,11 @@
+{
+    "Payloads": [
+        {
+            "FwVersion": "5",
+            "Guid": "e2bb9c06-70e9-4b14-97a3-5a7913176e3f",
+            "LowestSupportedVersion": "1",
+            "Payload": "$UEFI_FIRMWARE_BINARY",
+            "UpdateImageIndex": "0"
+        }
+    ]
+}
diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_=
capsule.bbclass
index 0c3d3845..cf708412 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -1,6 +1,7 @@
 # This class generates UEFI capsules
 # The current class supports generating a capsule with single firmware bin=
ary

+DEPENDS +=3D "gettext-native"
 inherit python3native

 IMAGE_TYPES +=3D "uefi_capsule"
@@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?=3D "uefi.capsule"

 # The following variables must be set to be able to generate a capsule upd=
ate
 UEFI_FIRMWARE_BINARY ?=3D ""
-UEFI_FIRMWARE_VERSION ?=3D ""
-UEFI_FIRMWARE_LSV ?=3D ""
-UEFI_FIRMWARE_GUID ?=3D ""
-UEFI_FIRMWARE_UPDATE_INDEX ?=3D ""
+UEFI_CAPSULE_CONFIG ?=3D ""

 # Check if the required variables are set
 python() {
-    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION", "UEFI_FIR=
MWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
+    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
@@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){
     # Force the GenerateCapsule script to use python3
     export PYTHON_COMMAND=3D${PYTHON}

-    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/Gen=
erateCapsule -e -o \
-    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} --=
fw-version ${UEFI_FIRMWARE_VERSION} \
-    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose --up=
date-image-index \
-    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATION}/${UEFI_=
FIRMWARE_BINARY}
+    # Copy the firmware and the capsule config json to current directory
+    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
+        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
+    fi
+
+    export UEFI_FIRMWARE_BINARY=3D${UEFI_FIRMWARE_BINARY}
+    envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-image.=
json
+
+    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/Gen=
erateCapsule \
+    -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
+    ${MACHINE}-capsule-update-image.json
+
+    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
+    rm ${UEFI_FIRMWARE_BINARY}
+
 }

 # The firmware binary should be created before generating the capsule
--
2.17.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#4391): https://lists.yoctoproject.org/g/meta-arm/messag=
e/4391
Mute This Topic: https://lists.yoctoproject.org/mt/96980035/5052612
Group Owner: meta-arm+owner@lists.yoctoproject.org<mailto:meta-arm%2Bowner@=
lists.yoctoproject.org>
Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [quaresma.jose=
@gmail.com<mailto:quaresma.jose@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
Best regards,

Jos=E9 Quaresma

--_000_AS8PR08MB7173457DC8CA031163EAB41AE0A39AS8PR08MB7173eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hello Jose,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The&nbsp;&nbsp;<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkM=
acSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15=
px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); display: inl=
ine !important;" class=3D"ContentPasted1 ContentPasted2">CAPSULE_IMGTYPE
 is used in the&nbsp;uefi_capsule.bbclass as shown below.&nbsp;</span></div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15px; color: rgb(=
0, 0, 0); background-color: rgb(255, 255, 255); display: inline !important;=
" class=3D"ContentPasted1 ContentPasted2"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15px; color: rgb(=
0, 0, 0); background-color: rgb(255, 255, 255); display: inline !important;=
" class=3D"ContentPasted1 ContentPasted2 ContentPasted3">IMAGE_TYPEDEP:uefi=
_capsule:append
 =3D &quot;${CAPSULE_IMGTYPE}&quot;<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 15px; color: rgb(=
0, 0, 0); background-color: rgb(255, 255, 255); display: inline !important;=
" class=3D"ContentPasted1 ContentPasted2 ContentPasted3"><br>
</span></div>
<div class=3D"elementToProof">
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best regards,<br>
Gowtham Suresh Kumar</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jose Quaresma &lt;qua=
resma.jose@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, February 15, 2023 12:23 PM<br>
<b>To:</b> Gowtham Suresh Kumar &lt;Gowtham.SureshKumar@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 2/2] arm-bsp/uefi_capsule: Use json f=
ile to pass capsule config</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Hi Gowtham,</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">Gowtham Suresh Kumar &lt;<a href=3D=
"mailto:gowtham.sureshkumar@arm.com">gowtham.sureshkumar@arm.com</a>&gt; es=
creveu no dia quarta, 15/02/2023 =E0(s) 10:42:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
From: Gowtham Suresh Kumar &lt;<a href=3D"mailto:gowtham.sureshkumar@arm.co=
m" target=3D"_blank">gowtham.sureshkumar@arm.com</a>&gt;<br>
<br>
This patch uses the json config file for UEFI capsule generation<br>
as this is efficient and easily scalable to generate multiple<br>
capsules.<br>
<br>
Signed-off-by: Gowtham Suresh Kumar &lt;<a href=3D"mailto:gowtham.sureshkum=
ar@arm.com" target=3D"_blank">gowtham.sureshkumar@arm.com</a>&gt;<br>
---<br>
&nbsp;.../recipes-bsp/images/<a href=3D"http://corstone1000-image.bb" rel=
=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a>&nbsp; |&nbsp; 8=
 +++---<br>
&nbsp;...rstone1000-image-capsule-update-image.json | 11 ++++++++<br>
&nbsp;meta-arm/classes/uefi_capsule.bbclass&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| 27 ++++++++++++-------<br>
&nbsp;3 files changed, 32 insertions(+), 14 deletions(-)<br>
&nbsp;create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000=
-image-capsule-update-image.json<br>
<br>
diff --git a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000=
-image.bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a> b=
/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.bb" r=
el=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
index b0a71bca..ce4df8a6 100644<br>
--- a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.=
bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
+++ b/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.=
bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
@@ -13,11 +13,9 @@ PACKAGE_INSTALL =3D &quot;&quot;<br>
<br>
&nbsp;IMAGE_FSTYPES +=3D &quot;wic wic.nopt uefi_capsule&quot;<br>
<br>
-UEFI_FIRMWARE_BINARY =3D &quot;corstone1000-image-${MACHINE}.wic.nopt&quot=
;<br>
-UEFI_FIRMWARE_VERSION =3D &quot;5&quot;<br>
-UEFI_FIRMWARE_LSV =3D &quot;0&quot;<br>
-UEFI_FIRMWARE_GUID =3D &quot;e2bb9c06-70e9-4b14-97a3-5a7913176e3f&quot;<br=
>
-UEFI_FIRMWARE_UPDATE_INDEX =3D &quot;0&quot;<br>
+UEFI_FIRMWARE_BINARY =3D &quot;${PN}-${MACHINE}.wic.nopt&quot;<br>
+UEFI_CAPSULE_CONFIG =3D &quot;${THISDIR}/files/${PN}-capsule-update-image.=
json&quot;<br>
+CAPSULE_IMGTYPE =3D &quot;wic.nopt&quot;<br>
</blockquote>
<div><br>
</div>
<div>Looks like this variable is not used anywhere.</div>
<div><br>
</div>
<div>Jose</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<br>
&nbsp;do_sign_images() {<br>
&nbsp; &nbsp; &nbsp;# Sign TF-A BL2<br>
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsu=
le-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-i=
mage-capsule-update-image.json<br>
new file mode 100644<br>
index 00000000..0f011ff7<br>
--- /dev/null<br>
+++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-upda=
te-image.json<br>
@@ -0,0 +1,11 @@<br>
+{<br>
+&nbsp; &nbsp; &quot;Payloads&quot;: [<br>
+&nbsp; &nbsp; &nbsp; &nbsp; {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;FwVersion&quot;: &quot;5&q=
uot;,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Guid&quot;: &quot;e2bb9c06=
-70e9-4b14-97a3-5a7913176e3f&quot;,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;LowestSupportedVersion&quo=
t;: &quot;1&quot;,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Payload&quot;: &quot;$UEFI=
_FIRMWARE_BINARY&quot;,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;UpdateImageIndex&quot;: &q=
uot;0&quot;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; }<br>
+&nbsp; &nbsp; ]<br>
+}<br>
diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_=
capsule.bbclass<br>
index 0c3d3845..cf708412 100644<br>
--- a/meta-arm/classes/uefi_capsule.bbclass<br>
+++ b/meta-arm/classes/uefi_capsule.bbclass<br>
@@ -1,6 +1,7 @@<br>
&nbsp;# This class generates UEFI capsules<br>
&nbsp;# The current class supports generating a capsule with single firmwar=
e binary<br>
<br>
+DEPENDS +=3D &quot;gettext-native&quot;<br>
&nbsp;inherit python3native<br>
<br>
&nbsp;IMAGE_TYPES +=3D &quot;uefi_capsule&quot;<br>
@@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?=3D &quot;uefi.capsule&quot;<br>
<br>
&nbsp;# The following variables must be set to be able to generate a capsul=
e update<br>
&nbsp;UEFI_FIRMWARE_BINARY ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_VERSION ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_LSV ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_GUID ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_UPDATE_INDEX ?=3D &quot;&quot;<br>
+UEFI_CAPSULE_CONFIG ?=3D &quot;&quot;<br>
<br>
&nbsp;# Check if the required variables are set<br>
&nbsp;python() {<br>
-&nbsp; &nbsp; for var in [&quot;UEFI_FIRMWARE_BINARY&quot;, &quot;UEFI_FIR=
MWARE_VERSION&quot;, &quot;UEFI_FIRMWARE_LSV&quot;, &quot;UEFI_FIRMWARE_GUI=
D&quot;, &quot;UEFI_FIRMWARE_UPDATE_INDEX&quot;]:<br>
+&nbsp; &nbsp; for var in [&quot;UEFI_FIRMWARE_BINARY&quot;, &quot;UEFI_CAP=
SULE_CONFIG&quot;]:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not d.getVar(var):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;raise bb.parse.SkipRecipe(f=
&quot;{var} not set&quot;)<br>
&nbsp;}<br>
@@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){<br>
&nbsp; &nbsp; &nbsp;# Force the GenerateCapsule script to use python3<br>
&nbsp; &nbsp; &nbsp;export PYTHON_COMMAND=3D${PYTHON}<br>
<br>
-&nbsp; &nbsp; ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/Pos=
ixLike/GenerateCapsule -e -o \<br>
-&nbsp; &nbsp; ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXT=
ENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \<br>
-&nbsp; &nbsp; --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --ve=
rbose --update-image-index \<br>
-&nbsp; &nbsp; ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATIO=
N}/${UEFI_FIRMWARE_BINARY}<br>
+&nbsp; &nbsp; # Copy the firmware and the capsule config json to current d=
irectory<br>
+&nbsp; &nbsp; if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; th=
en<br>
+&nbsp; &nbsp; &nbsp; &nbsp; cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINA=
RY} . ;<br>
+&nbsp; &nbsp; fi<br>
+<br>
+&nbsp; &nbsp; export UEFI_FIRMWARE_BINARY=3D${UEFI_FIRMWARE_BINARY}<br>
+&nbsp; &nbsp; envsubst &lt; ${UEFI_CAPSULE_CONFIG} &gt; ./${MACHINE}-capsu=
le-update-image.json<br>
+<br>
+&nbsp; &nbsp; ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/Pos=
ixLike/GenerateCapsule \<br>
+&nbsp; &nbsp; -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \<br>
+&nbsp; &nbsp; ${MACHINE}-capsule-update-image.json<br>
+<br>
+&nbsp; &nbsp; # Remove the firmware to avoid contamination of IMGDEPLOYDIR=
<br>
+&nbsp; &nbsp; rm ${UEFI_FIRMWARE_BINARY}<br>
+<br>
&nbsp;}<br>
<br>
&nbsp;# The firmware binary should be created before generating the capsule=
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#4391): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/4391" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/message/4391</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96980035/5052=
612" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/mt/96980035/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">
meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-arm/unsub</a> [<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr">Best regards,
<div><br>
Jos=E9 Quaresma</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB7173457DC8CA031163EAB41AE0A39AS8PR08MB7173eurp_--


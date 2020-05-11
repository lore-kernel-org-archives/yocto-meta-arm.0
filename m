Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web12.11748.1589203366649346648
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nQdGVNe7;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEmz9yOcHeBWne+v1wG35rB4vVh61+noAnNPUm+iEmw=;
 b=nQdGVNe7jSLKHKTb4B2vfq2kgKaE7ocp2a6mptjTMSFCMqijHnHJZ2miHJj/HE8CBEviZSjacSpo7xbxOAL57lmJaiKN92J1CZqycM067PRd2t1VgrifUSVCp99ucqkny/kWx8He6UsvJZSssLBclGCaXMlui3aTnYTbK7D8VN0=
Received: from MRXP264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::22)
 by DB6PR08MB2838.eurprd08.prod.outlook.com (2603:10a6:6:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.35; Mon, 11 May
 2020 13:22:42 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::bb) by MRXP264CA0010.outlook.office365.com
 (2603:10a6:500:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend
 Transport; Mon, 11 May 2020 13:22:42 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:22:41 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54"); Mon, 11 May 2020 13:22:41 +0000
X-CR-MTA-TID: 64aa7808
Received: from aed8dd77a77d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 15DAFBFA-0912-413A-86C9-0E905F1AEC38.1;
	Mon, 11 May 2020 13:22:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aed8dd77a77d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2M8/PRFp2250ZcZ+awSPkhGZHrRAQPn8i5E3JsfbIgG7tqQ3mlUv3cLjFUV5LD70zv0phDc0fhADxah/TXEemuWEmzGrK7NAZ/EZFMemnRqCvp3OW/QRoJTO7j88sDDMxIdG/I5pJABjDBhm296aM47wfGcCVsKLuszD3wAJeGMwCqqd8PMegiv4iqmRKDV+upLOrIFepCeAAUZpxgV0g+l4yb2aPe4cjvLRlr4A8inXEX0203BcWT4Agum8Sq9wGtWjRns0BBF5C2bw52VelNkG6189+yYVZJK3GoZM7Q31ex/JI4AN/vwlJ2w+DraubuYtHMvKAw/2UM7ghKu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEmz9yOcHeBWne+v1wG35rB4vVh61+noAnNPUm+iEmw=;
 b=oHSBfX0oRoVQ0y7/SC5xe/KyZwdosEjM1RZ/cU2lJMY9nBAPEyuDJY0/b1GKKBZ4qW4uhPV6GxBp2vMRC0B1rjBP45CsdL0OoohUc7mTyUDDq/jpr5GXLhjKHc/MNggUZ38/LcYP+HXI52/Cr/cWcpKA2Pu4kIf0P4ltEJ6KFZya3cH2BjIW9CaOoB3dyLitNOKfloToFEYMjKWY5Tw4c9dbWWSNXGmdKvAhM1+K5pYiEB9OpwU+L6PFdan0fs2kpIFWVOyjDP00ErJwflMzsMJu7C66o2BY31cOnLOB7zSAnz0gpRe+OO1c9Hwjb6bUED7lwX+rbzn4ETtj+RImdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEmz9yOcHeBWne+v1wG35rB4vVh61+noAnNPUm+iEmw=;
 b=nQdGVNe7jSLKHKTb4B2vfq2kgKaE7ocp2a6mptjTMSFCMqijHnHJZ2miHJj/HE8CBEviZSjacSpo7xbxOAL57lmJaiKN92J1CZqycM067PRd2t1VgrifUSVCp99ucqkny/kWx8He6UsvJZSssLBclGCaXMlui3aTnYTbK7D8VN0=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4497.eurprd08.prod.outlook.com (2603:10a6:208:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Mon, 11 May
 2020 13:22:34 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:22:34 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and CONFIG_BLK_DEV_DM in xen-host.cfg
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and
 CONFIG_BLK_DEV_DM in xen-host.cfg
Thread-Index: AQHWJ5aJ04cR9youxE6dgf38h02Vu6ii3lsw
Date: Mon, 11 May 2020 13:22:34 +0000
Message-ID: 
 <AM0PR08MB3987ABA4FD7152E29DD4EC9E92A10@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <160DFBA131AFFF52.7726@lists.yoctoproject.org>
In-Reply-To: <160DFBA131AFFF52.7726@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: fc307fc0-950c-45e8-a32a-e8ac08d2ce0e.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e5f1230-0662-46be-b4c8-08d7f5ae621e
x-ms-traffictypediagnostic: AM0PR08MB4497:|AM0PR08MB4497:|DB6PR08MB2838:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB28381131120321694E25FC5B92A10@DB6PR08MB2838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rLp/BcqS7Vs0h9GvWZtRRSX39ZCPDw1AhIPqWS4ECNsU1KuDY9q2HGfLPM/0ORT2D7Gfa2+wlq3EiAOCN1cThvzOBVdTkHMspujvS+vzf4ja4INGIeN3rICp6NGyhzcPi7rgKbH7JBfB44isXWIv4+GHI56tH8s+HWBULda0ggaQq76IQaQJIeIr4VB5Fuc054cBlCYBpZluHf4TvbXXl/aFO0EDroRFZ/02hv9NFB49UCNLM5yKljW0qOnaPyMBmq0Id8mQvk03t5peDAVcDD3wJnUvZfNrTCRQeFVsMXH3Zh9vwHCWnKZKsW5AiytmyQg2PGjUu375cPIOyUMFFT9YzRsdoySFtWbiaMz8Uh6RuwtpC7A9ESxmvA3yPIKFE7i9pBl9hzWNoX1wwZFXO53I1rsytQ4RAJTfwjyE7tCQIkJ8/mjR4aGW78b71jmEsEwXuyAekrLhWAsp1LHvf7Bhx7uMlnQ6RoZcXc4hf5U2qABwKBXYJlhx+iqHFlIX+woF2pVx1JJayHYXR/9csw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(33430700001)(110136005)(8936002)(6506007)(26005)(7696005)(2906002)(186003)(33656002)(71200400001)(55016002)(5660300002)(9686003)(52536014)(53546011)(8676002)(76116006)(64756008)(66446008)(4326008)(66556008)(66946007)(66476007)(33440700001)(86362001)(316002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 2VN3QbMaKz0Vrec2MpsHR//oUqrryOgICoYj2rH075IDx4BA1sw39j/c6K9W884N1Biakondo/3CtkiIxNekXhwFBq/kk/evWNsO7EzSyA827yUnY9ahiUxV9NGtmUQXkNBP6m3OZmOCpowHXW5q80OkDqX1lxFkkOJQcp+i+Mi/DHTX9ispKXdo/m3WJC8vLQHChTW1oDRsy+2NKaS7AKMVbhMkiXzFmthy4plxfU+BGudjyHTZPgjxx/MnxpWn8jmLNAiQq8mx+Uwj9nQ9lvTBZCMPrbLWZJg8jbf51+V7NZN8DVSoatI6ca+0giqZBkjTRgnoRBCj89Mf4EcNtFzcf/fLxWCEyyJ6Q9JK37j8qQT00pqcDjm3c1ms6AU0dJJyw2Cx2VNJj0dAx7zoS7qD2sM7hF8JjBn5Qn98+2b7dtekvxKxcf75mryFbe7HiClx4HPRbQYQyvotJ/u+AM/kkv8fi3Cnbp3o1qc2kUA=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4497
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(33430700001)(8936002)(478600001)(7696005)(52536014)(82310400002)(33440700001)(33656002)(47076004)(70206006)(53546011)(6506007)(81166007)(82740400003)(110136005)(26005)(186003)(4326008)(70586007)(356005)(5660300002)(336012)(36906005)(316002)(86362001)(8676002)(55016002)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6a61bee6-28b0-4c63-392b-08d7f5ae5dcf
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GTPj/wINC2/cRsvK/l4IZ5nenVaXQH/6pVUkcdfLDEGBBf2CXS5rhYf5PhyElk34oZqUbjbAfJmCBVj6jD/5npbBZcIlGAZ+ICbvH8JyU1OND/Pj5XhXkPqAo5sm4iyQTBi6IXre35zKgR3nRh9ipYSugTGuHrUBljNxJbtbGdtNXipBwJblJepCGtlkwNEw1r4sOpLKkwxjVSNJzCBPASi7rDLqtcSg6Sv0Dls5T+QYgbmJ06kLzNM84tmbNvrZBmsWrHtEoJpNhUFgQc3ulUx4gVq2J0pRE1vwgGY9+V6M8smtZgPT8XH5BAWfeNsts+xwZa3yBJWWVu1amXdld0VluiNxhP+9NLG15WEsM4HH0XkCGJye6TZldXYLw9LT5O6ZdSasMg4+wTxYT8UP6mQudo2JT5sep/l50Az8mxOn2X3slwm6rj4rCN2JurYL1mfglCTgo9TDhru04hHZ7zTqBJx2pXGiQlWbtwAHe4PXQ15NPxN9s5SHKK53jpi27hv6hj8qi1+/++6ogu5RizcB8QCJ8Xx2Q1cxPsT3/gD1Q3A0Jn+GMrfGGZzbdrA/hg1ih26Xm17O6zT3jPo2pg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:22:41.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5f1230-0662-46be-b4c8-08d7f5ae621e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2838
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

There is something strange with this patch. A `git show` command gives me:
+# For LVM2 we need Multiple Devices and Device Mapper support
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy


But the patch bellow is missing showing as:
> +# For LVM2 we need Multiple Devices and Device Mapper support
> +CONFIG_MD=3Dy CONFIG_BLK_DEV_DM=3Dy



> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Diego Sueiro via lists.yoctoproject.org
> Sent: 11 May 2020 14:15
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and
> CONFIG_BLK_DEV_DM in xen-host.cfg
>=20
> The CONFIG_MD (Multiple Devices) and CONFIG_BLK_DEV_DM (Device
> Mapper) kernel configs are needed for LVM2, so add them in xen-host.cfg t=
o
> be included in the kernel configuration for DOM0.
>=20
> Change-Id: Ib5f4f4d767751615ee1239e95da7a7d56cbbc2dc
> Issue-Id: SCM-996
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  .../linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg        |
> 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-
> autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-
> autonomy/xen-host.cfg
> index 2affab9..d457cb8 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm-autonomy/xen-host.cfg
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features
> +++ /arm-autonomy/xen-host.cfg
> @@ -33,3 +33,6 @@ CONFIG_SWIOTLB_XEN=3Dy
>  CONFIG_XEN_EFI=3Dy
>  CONFIG_XEN_AUTO_XLATE=3Dy
>=20
> +# For LVM2 we need Multiple Devices and Device Mapper support
> +CONFIG_MD=3Dy CONFIG_BLK_DEV_DM=3Dy
> --
> 2.7.4


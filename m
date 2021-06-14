Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.72])
 by mx.groups.io with SMTP id smtpd.web12.27222.1623657965032629069
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 01:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2LEyMsyM;
 spf=pass (domain: arm.com, ip: 40.107.6.72, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUqQn0BSd+Y5aaAIdYIAmZ2j07g6CY5VIhYkNuyUA/k=;
 b=2LEyMsyMvfQCLMZ3wN1gm5tuCqsyYCOgGPDEz5EVNLLal0BpW9IN2ICsbP+Y4Xqwn/cEBwQF3CteWkFUjGI9GXYpnlUrgzXU0stj0N+etMaXVMZfNGftXExljmXs21jcmjy0Pbz2kiw6/CNyVOLEmrQlYO0Tb9JICl3A1RUkaUA=
Received: from AM6P193CA0121.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::26)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 08:06:03 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::7d) by AM6P193CA0121.outlook.office365.com
 (2603:10a6:209:85::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Mon, 14 Jun 2021 08:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 08:06:02 +0000
Received: ("Tessian outbound a5ae8c02e74f:v93"); Mon, 14 Jun 2021 08:06:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ba902ce54856b8e
X-CR-MTA-TID: 64aa7808
Received: from 10c9ddf985e9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 52714838-C412-4764-9D3B-D800262BAA88.1;
	Mon, 14 Jun 2021 08:05:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10c9ddf985e9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 14 Jun 2021 08:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ4IvKEAKJmyhS1I5dtjCAc8Uz0J59ayyPTh6SOKTxwf+c6E3iqZnYdj03OUaMe8WpOQrAR3D3TuZtYQU8JwbeYYrPuoudDlzVfvKH2jQPdivavGI7qv4DnRSCP64c04o0O2G+5rXt7Ozc8ZQlPSm2CgyHQS7LZgdLPsW+4sRPUMGwWEgeezObf3yRgxBu+ETij+QBulJEVmDHUHw7FC/tcqYCLYgeLGLe5eTdwO1qEUJzFnbEpQzRT0ZKzKM414ah7GFvw4qNiAy2scs4Px2SEcoeELnJlgiRBKup1j5rZ9Afj48Z2H7hcISVAXgFioFL3rnIuvxFLGRgC6a6H7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUqQn0BSd+Y5aaAIdYIAmZ2j07g6CY5VIhYkNuyUA/k=;
 b=d8srh1D5yuL/6HT+KdVoRg82ekmRQEBCJyBB1CPB33j8SuNWQ6HJQYAwtF1uT7HKPyf4XxkokeEcVDFuMm3scfdmqiQn31d4X6tXzQvclaPmvFMCXvvoLkuqEGKX+cZmclm2qY9IL0UGgrrv7G3GDUm5fKZsOPpwh7vOxyxJ9O243vakOaNVo56z+22lvVenWs2o1c9FwQ3G5viSOnOjui44nhJDWM8PKoK8N/IjQwvGdPeRXqLCHDqOP/fTcUoTVMuqb5RGWUYYzoXcvFMyCg2K898ZcaE8cvb3Z8sjau+Xt5cCtGlnhKyVmCjr6eNoyP8Cxv2tejwdZ04g9zieRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUqQn0BSd+Y5aaAIdYIAmZ2j07g6CY5VIhYkNuyUA/k=;
 b=2LEyMsyMvfQCLMZ3wN1gm5tuCqsyYCOgGPDEz5EVNLLal0BpW9IN2ICsbP+Y4Xqwn/cEBwQF3CteWkFUjGI9GXYpnlUrgzXU0stj0N+etMaXVMZfNGftXExljmXs21jcmjy0Pbz2kiw6/CNyVOLEmrQlYO0Tb9JICl3A1RUkaUA=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (2603:10a6:10:1ac::23)
 by DBBPR08MB4315.eurprd08.prod.outlook.com (2603:10a6:10:cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 08:05:51 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::9564:67f3:8ca3:e2d9]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::9564:67f3:8ca3:e2d9%8]) with mapi id 15.20.4219.023; Mon, 14 Jun 2021
 08:05:51 +0000
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Hugo
 L'hostis <Hugo.Lhostis@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/n1sdp: add kernel modules to mount FAT filesystem
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/n1sdp: add kernel modules to
 mount FAT filesystem
Thread-Index: AQHXXtesrTJ3KJM2p0yiV+NlCAr226sTKiFP
Date: Mon, 14 Jun 2021 08:05:50 +0000
Message-ID: 
 <DBAPR08MB5560079B36397C395F6EB66A86319@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <1687913139920EBA.25451@lists.yoctoproject.org>
In-Reply-To: <1687913139920EBA.25451@lists.yoctoproject.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5e3ccb-f14e-4f1d-1f64-08d92f0b4096
x-ms-traffictypediagnostic: DBBPR08MB4315:|DB9PR08MB6714:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB6714F5232EE5C631E381E8EA86319@DB9PR08MB6714.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dCTQoK2+GKp9/JK6j45V5Mi1JDZQv5UQjic3Iqhsdn7weyUj7Eu/5BXspFhAk1bnS4V1ZoH7butAF4GbGBInwLIqfeu7y/4zq3lrNIUhNTFJU/HceloiTcBQlgNM16eZq+3/UX5aT/+w3phpIjbo7hKTgbFxKQaMPMONGofuFmLS8LUWwb8y1gwv6MOSJIFIrbh1yGydCQONbScDz5imwJplCxKCbBqYfa7kqCJfhM88uAPBRJXlKVYBit7wMzrcRTgzeu8jf7GKpOLRTFGHwdQlNaZalTxt7bFKXMwT2Jv5SUuAvIeWgqSmj6k2hCJmVP8GQ4z71tU4L0jhr7X6Fl6N1ZVk/pyo7jiExXmTk62MI6ExQPPi0FgTj4OgknEO1+yD+wrs5MLSqulFAj1XKrE5msqZGDKj0eTqKOYMRot1J9P4CxYMwkfFn+SPagrm8xX3fq0gF6Wns6Lf/5rImQY4g94R9EEyAXE+Mt+V/0JFO9An/CP9wY8npbjoEGHk/dYzS92UmbisXrTZloMDYXsWTm1dhFAWv/09EY4V8aqOOftQblE7iasPGC7m05qfPsD6Bi4Mx8DZ/CJr01HuaizH5sd65Zm3pB7lkMGQsePpnQL5P0r5onE+S+d+ezc4cvEh8H9lmKbSuviBf8aiCPPOvoFfgklMGbIIa2mjeZ3lg5k/fTllaKClSXAKWcXX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66946007)(52536014)(66446008)(64756008)(66556008)(66476007)(2906002)(33656002)(5660300002)(76116006)(91956017)(71200400001)(26005)(122000001)(316002)(478600001)(55016002)(9686003)(7696005)(4326008)(6506007)(19627405001)(8676002)(110136005)(86362001)(38100700002)(8936002)(186003)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Y0l+Rk9YDDCzVqAqz/Z7cgsGBp3vHKGgmGyWz3MfMsKxBvXCEl6bTv6SwP?=
 =?iso-8859-1?Q?EjBYc6NQKWm7sbw7hSylGTtxFJCj67JmyXpw+iH86VDkvqW16L7ngy9WSX?=
 =?iso-8859-1?Q?vzZjr9MqZ/boKuiVcgXPnCIwfILg4FvGuH4T/thNC902mg4zJ0JOtjnKZH?=
 =?iso-8859-1?Q?sh20FxvLjjLM5piI1THq0Nik/2hx8kTNKfMXuu7BwE1MkkRIdQH4szlgl6?=
 =?iso-8859-1?Q?fWWc9CaYF/nqu1KLyKDZPETn82rScig5QYWgpBFBgkm78yKZrUzg1oWZw2?=
 =?iso-8859-1?Q?3bTSOILrXIkliagf84/r9rqYhRnjqC5J1j/9CCH9z94MVRgjXmh+8tP0uZ?=
 =?iso-8859-1?Q?EgZWM6SzxNGLdqGqMoPYoQuSv+vg5weuO1L+cJHKijE54Hattb8V+w8pK3?=
 =?iso-8859-1?Q?jJThNwPwBzKSt9Q8uGHmbTaP6oRHKtEp/qinPuy2A9aIGlMLVLYe3k4oDo?=
 =?iso-8859-1?Q?KCqnq0zTV+3cw+oZGL5tgwfrSO6KfShU3W94dZKZMmBZnOv3Few10P0VjQ?=
 =?iso-8859-1?Q?hhm6rg4JkbA10hBOi7Okbhfl0tr0L9cXacuyIhvxvzrzLBZy5tIy6U0CXH?=
 =?iso-8859-1?Q?3TUgXxAt24F2FfCyZZ8xBaa/d6hUqTJWBv1uZzjcT6iptPNGjk05qPcoYT?=
 =?iso-8859-1?Q?6Az77SHfGzQxYb/i1WmIoIgVlEXLzIlP6AF3yaAL2FEWbwm1g+618EB8mN?=
 =?iso-8859-1?Q?nnXB2obPs2oYThJtLBOT0n4Ix7piVkDMeHDrFwl/37y+Axa0cOduFLNCBm?=
 =?iso-8859-1?Q?WWCJN98p4llV1b9FoLF2PYjG/VLMoZ8VBv9JGlQ6z9cRRzGZWvPn9QCfN5?=
 =?iso-8859-1?Q?Goe2eGDtLEc3/scjrbbBvD8bfD246KCutBFoAgZ8jF5S3jYqf0DisCbD54?=
 =?iso-8859-1?Q?UZaLTKbYcgXwu6y6x7CRxanmTWWbA7YB4gX9OWTp7rf1iT5BzYq07j340Z?=
 =?iso-8859-1?Q?3smWRAr+t2hhVHnkyn7aHUm/nUK3lFvfWTiSag+rDzdGvHOxCpeL8QzLlk?=
 =?iso-8859-1?Q?+2tRqj4WUKP5CFf0zilsPmUbPgw/IDr54e9I9iwYWskZzev9L2Pd8/+aA8?=
 =?iso-8859-1?Q?q8UhzVXGv6rlGfcpAFK8MfZN8DmoYQhYnahBF047Wg1cQ3VbE+pOUgE6e6?=
 =?iso-8859-1?Q?yprYG5Un7c8vA3dAyEISMe+9yg3scOlOfH7xmxDdQiIcOUyUiwY+MzBLdB?=
 =?iso-8859-1?Q?J7bzdikIKnvjCAb2CqQ+bDPvvbLMrhr10thUm/Xkg64foFce/f90Ss0GfT?=
 =?iso-8859-1?Q?ENdtJ9H7W0NyjkgaYBqXLniHvjBhiHCnqRgxOrY44Gy0lNcFmASjoZJqag?=
 =?iso-8859-1?Q?QfKRdP9VEGZ4qZA99czzqbZyiBgygZX3CJdi/2vG9SCQDlI=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4315
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Hugo.Lhostis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc4b0400-0070-4c4f-922e-08d92f0b39e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPYvi2hn0cpPVQnmtnU3PyZX3qgnK+edOxIjHBow9z6Q1kciXRZ62ccq06ZnOU0ewdoqiDbhbwsm2z5gtKAJWiKYrO/vETJ1L9vSv1fbtZpbBJ0namHwLy1qcuFlVLpRDhUDeIzDbfhZWi9Gzok3sGhoUphoUabVQo1TDNJTxd4Jv/ME5ymoVzOUK3oewSjibsMVzxnfzRfn0oxodvsK3lu2cxNktcI80cT1np3Z9pbZ0BhByEBln9TKmfxbwLRD1LmncNvmUz12VLGb4g0k/1+wWIePOISR5OMnXrges915VKOeN70DpiAt5gbJ2e2B0yB7J2z3IPfpbHD9nqXKRBrEM50TaG3n+foesrbPICxGRerPpOU0tUw/vZnYibN49GkEV4opBbxiew3l0uK/CnQkq8J1Hl/mUk7AxgqBU+2zYM+aXymKnV4ADNQHYxyAbDUIQOl37KVpRmnxWA919SNqbEn5J8hFWpyc1eBcRRgFi7r69e8wMKKIRFSv3J2sCF8COqUs7YkBx09zZzIusetq/rhzY2hOmxEo/XZQds3hD4qTunBNuZJS6TQ35oYdBMkhjUHgtPGIB38eWczJo2h6qKE7tyiU32sjJBoteNKhpFCdwruMoeDcnI94P/vr9vTHHwyl96W+1h/JYyEB/5n0NafUstpaeg8SCOHS7xvELftZ1W4MDT8fPiDUxiS83O9dGXDNz4KU4C7OQ9/S/w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(81166007)(7696005)(478600001)(9686003)(316002)(19627405001)(55016002)(356005)(5660300002)(52536014)(110136005)(82740400003)(47076005)(33656002)(36860700001)(6506007)(70206006)(70586007)(186003)(2906002)(4326008)(8936002)(86362001)(82310400003)(8676002)(26005)(336012)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:06:02.3242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5e3ccb-f14e-4f1d-1f64-08d92f0b4096
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB5560079B36397C395F6EB66A86319DBAPR08MB5560eurp_"

--_000_DBAPR08MB5560079B36397C395F6EB66A86319DBAPR08MB5560eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Jon,

Could you also backport this patch for the hardknott branch please ?

Thank you,

Hugo L'Hostis
________________________________
De : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> de l=
a part de Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Envoy=E9 : vendredi 11 juin 2021 16:36
=C0 : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc : nd <nd@arm.com>
Objet : [meta-arm] [PATCH] arm-autonomy/n1sdp: add kernel modules to mount =
FAT filesystem

This patch adds kernel modules necessary for n1sdp to mount the FAT filesys=
tem
codepage 437 and NLS ISO 8859-1.

Issue-Id: SCM-2682
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I2d4fede311544917050326564b2b0a7d0123cb21
---
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1s=
dp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/=
machine/n1sdp-extra-settings.inc
index 5731142..0bd150b 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extr=
a-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extr=
a-settings.inc
@@ -84,3 +84,7 @@ IMAGE_EFI_BOOT_FILES +=3D "\
 ${@ d.getVar('GRUB_CFG_EXTRA_FILE',d) or '' \
 if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d=
) and \
 d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
+
+# Additionnal kernel modules are necessary for n1sdp to be able to mount F=
AT
+# filesystems using CP437.
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append =3D " kernel-module-nls-cp437 kern=
el-module-nls-iso8859-1"
--
2.25.1


--_000_DBAPR08MB5560079B36397C395F6EB66A86319DBAPR08MB5560eurp_
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
: 12pt; color: rgb(0, 0, 0);">
Hello Jon,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you also backport this patch for the hardknott branch please ? <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hugo L'Hostis<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> meta-arm@lists.yoctopr=
oject.org &lt;meta-arm@lists.yoctoproject.org&gt; de la part de Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Envoy=E9 :</b> vendredi 11 juin 2021 16:36<br>
<b>=C0 :</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc&nbsp;:</b> nd &lt;nd@arm.com&gt;<br>
<b>Objet :</b> [meta-arm] [PATCH] arm-autonomy/n1sdp: add kernel modules to=
 mount FAT filesystem</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patch adds kernel modules necessary for n1sdp=
 to mount the FAT filesystem<br>
codepage 437 and NLS ISO 8859-1.<br>
<br>
Issue-Id: SCM-2682<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: I2d4fede311544917050326564b2b0a7d0123cb21<br>
---<br>
&nbsp;.../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++++<br>
&nbsp;1 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1s=
dp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/=
machine/n1sdp-extra-settings.inc<br>
index 5731142..0bd150b 100644<br>
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extr=
a-settings.inc<br>
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extr=
a-settings.inc<br>
@@ -84,3 +84,7 @@ IMAGE_EFI_BOOT_FILES +=3D &quot;\<br>
&nbsp;${@ d.getVar('GRUB_CFG_EXTRA_FILE',d) or '' \<br>
&nbsp;if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, Fal=
se, d) and \<br>
&nbsp;d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}&quot;<br>
+<br>
+# Additionnal kernel modules are necessary for n1sdp to be able to mount F=
AT<br>
+# filesystems using CP437.<br>
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append =3D &quot; kernel-module-nls-cp437=
 kernel-module-nls-iso8859-1&quot;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB5560079B36397C395F6EB66A86319DBAPR08MB5560eurp_--

Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.46])
 by mx.groups.io with SMTP id smtpd.web12.13767.1596180423742773292
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 00:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9Z/PDOcX;
 spf=pass (domain: arm.com, ip: 40.107.5.46, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhw4dknDJiXJS34hD6rIg3FhkGc23PGLACB1wQa2rc4=;
 b=9Z/PDOcXtTd/1TG3zGy2Cgcbi7SzOUvJcG4ZToxxphezd8BcfISV8WsoC72ut/KHRw9Ew7WF8NI5x2GHfhoPU/p2T5sT6Xma0elTKu3szpNBCMFNf5OwmQJkX1MaqHvBxpRLOjas69bwoVq2ddOZnZzgn7QCjwFNpYEXOvZYpDE=
Received: from DB6PR07CA0107.eurprd07.prod.outlook.com (2603:10a6:6:2c::21) by
 HE1PR08MB2841.eurprd08.prod.outlook.com (2603:10a6:7:35::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21; Fri, 31 Jul 2020 07:26:59 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::e2) by DB6PR07CA0107.outlook.office365.com
 (2603:10a6:6:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Fri, 31 Jul 2020 07:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 07:26:59 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Fri, 31 Jul 2020 07:26:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbb753e409169cf0
X-CR-MTA-TID: 64aa7808
Received: from cee65c567274.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1643D79-A794-47AB-9BE9-2F89ED1DFDE8.1;
	Fri, 31 Jul 2020 07:26:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cee65c567274.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 07:26:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJW+RRuw8x+nha5FiUYS4hfNjEvXSzvw3p7VgPVpw2/UlRB0f916RXvQF+0UojXCSkn66US/pxBM9HwSTdAwyKo0Uq8ZjUZwY2DMHgkcTPGnm+NFdtYmHABE8VGFD0dunEd3gHAX3X5EYqxYjcDeYKjc0OCvSNKqniU0zybet0NALFMhJCrnaMnELNJPVw6htqQh0RhcPDn5QhaWhMP2RRiyPOmDF6Y2eZ+oX7FNJCiRkctARr7t1UjMYKSUfn7i5PAPcWjT8uh4yaqLHaMovRVCH7gps17qJQXWxx3Ce+jKwOF7i+nw5dCvT0QwLzzaDEfYVvK60yvUI73abVtQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhw4dknDJiXJS34hD6rIg3FhkGc23PGLACB1wQa2rc4=;
 b=EENIhbm9MayKCJzml4Kr2Zita33SCkV8leriZyEvwQPgEBHEm2UGDVr/V42uw7MmR/+hNtZcQgNpD/+TH7gKJwdZ1KFeTe+HzeQE3g6Etfk6WuVoxlpoWw56W28VjBDVaH5UYY9f47Pts7ifxZAgCnBUf/uYU0pbtNpp5iz0jHyzu/JNp4ndyrCpgdO6BwHldgTxzn+TMwLxNYWn9Mt29yfNKHfEg9HFeiOGRY/W3OWCkwmmo5XxIAvj1qrFNWIZF/auWYr4Gb0orRmDco0OuTB7aMs8d/23GOrF7dG7yn0vl61gpO1f63NlJtObYLFbyxKjsb3Sy3m8q3lwt8zlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhw4dknDJiXJS34hD6rIg3FhkGc23PGLACB1wQa2rc4=;
 b=9Z/PDOcXtTd/1TG3zGy2Cgcbi7SzOUvJcG4ZToxxphezd8BcfISV8WsoC72ut/KHRw9Ew7WF8NI5x2GHfhoPU/p2T5sT6Xma0elTKu3szpNBCMFNf5OwmQJkX1MaqHvBxpRLOjas69bwoVq2ddOZnZzgn7QCjwFNpYEXOvZYpDE=
Received: from AM0PR08MB4963.eurprd08.prod.outlook.com (2603:10a6:208:159::16)
 by AM4PR0802MB2179.eurprd08.prod.outlook.com (2603:10a6:200:5c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 07:26:49 +0000
Received: from AM0PR08MB4963.eurprd08.prod.outlook.com
 ([fe80::a4f4:a4c5:ac3d:fbdb]) by AM0PR08MB4963.eurprd08.prod.outlook.com
 ([fe80::a4f4:a4c5:ac3d:fbdb%5]) with mapi id 15.20.3216.034; Fri, 31 Jul 2020
 07:26:49 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Khasim Mohammed <Khasim.Mohammed@arm.com>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP components
Thread-Topic: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for
 N1SDP components
Thread-Index: AQHWYOg551cUCcs3oUmTOB+Ul46goKkhVeJz
Date: Fri, 31 Jul 2020 07:26:48 +0000
Message-ID: 
 <AM0PR08MB4963425D98D65B5E63BDE965FA4E0@AM0PR08MB4963.eurprd08.prod.outlook.com>
References: <16245FA85AB8779A.27593@lists.yoctoproject.org>
In-Reply-To: <16245FA85AB8779A.27593@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b363fb7-70a8-4d9b-dce3-08d835231c98
x-ms-traffictypediagnostic: AM4PR0802MB2179:|HE1PR08MB2841:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB2841C962E78492815BC8ADA2FA4E0@HE1PR08MB2841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EunbhVCuzpKi3GFg7Y85b8ey1f4LAsMpIQGWfj5+CZBtPeWKDmMZWdTKSUKBI+zJYT5NBoWZH4gSi9MHMouIJgHB7TRVYVBmoOKy3oNEwmBsUogIgy4JTeCxtOy3q62yLh6+VABIFEGPK+oh/+3HjKaX3/AcXYqZxaIaxSJ0+/GTQ5WedNTHMytaaciw6GbUlzg6GGxM/UWC7Jffi8pqbmWP6DMdgD+1MRBOLf9nP1DWxrlPBiTn3igGY48m5psW/PMNDsJNXtJqyZxH11eiRvdgsDworAGMSEyNSaVFfQ1ohWWKuszB82dz5aFZbbdd55l/fPMMRyTByDQzszYR4EG+p8SSjDxoiPmNyIt6xYTNpV8RlzoZ0zh2ucNcyFHs
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4963.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(71200400001)(4326008)(33656002)(52536014)(55016002)(5660300002)(9686003)(8936002)(110136005)(316002)(478600001)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(86362001)(186003)(2906002)(7696005)(8676002)(53546011)(26005)(6506007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 WNoX6J/DeFwbTJNgCEzI4ZlImIscVZ7CmZyxP8C5DjUpkaYCevo5513iiuNF2BLvnU+2Cuew3Hzq0wrKifkif9xgU4BjFcgqNtBbKudW2+oeaoc47keP1hF/Iyr210G8dZFbFvwgxI9QVfRo2+TTL7B7ea0eS7SCeYRLsFV2W0NyGUQHqKsfAt+zQ2fi7e5MmuXtnWCRJ9S/6Q4ZoHjhJGKctLWD0gDgpz2xd+L3FYKNfcW+LVlEyK8kNs356i+VubWYrfsDA5bWvvO80YSf99YtgaORgaHAO2/9BqThUqALlTUtfez4/OYwEKo3Juz8/MStEg3Up+NOK7+AYdjwLES0FJR0KxV8/at6Y2fBgnWuZzsD/Iwg6CbrneVvr6rZbLnhKTK1GxTwJKHXT/VP6gIIegvF8A1lK6sjzxJLNqrLX1xp3Ez8CwWEniNtM4m6KY5x000q0JJZfV/qPtxGXYWotnyXvogYjgxc7hiyD8WTWFJ32tQ8+fVC/Eu78j+3lFboWDPeTzsKCisx3JJAKIhCQ2N+Rh+/BGe/iKx0R3L3QOQLwmnEhPjnRBViODp+3DTJ22T3vy6mjkj49kd/DKJzg4uhwHJsZyob+lVbYvRbmhNTaxvF0whYwjxJWo35IHI+/wkEwcu+z3w1HY9v+A==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2179
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78c86a4a-9cf7-4069-7fdf-08d83523167e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	APOzcXsStu5e+D/MJsHKrFXIrV3RCvRkSCf16B250V51H1MM6576nMi0hPIFyVuNhVv2u54+Qa9wT9BEFyV7SowrFHtca7uHCDjq5hR7JEHMP9u70ldBtCnFMeipAym3Q+lD9jeFbpOsiKTwraJs7NjhVc21+eDMb504Hpv4uPm8obRJont+q2RvwzmnqoUxUqIz5ud2zo4ifHxpMuUloUKh7SzXUQVOqhrvf+FTQwJ95o/DQ1Inaridxg4QeSoY7PEBQFfrH0gyaojAGfU0S/Io8JrlNGjlJSZKlwcARqV0EOitEq9RkLYeKwk4A7MqHE4L7UbNB/EjGZPQXpAOB+gMT7Xxt87bxLSBhdOBBpRWmK77+OKjU6Wpng5vAiEA4Nw1SpZ6ayxFk1Vd4SU8LtUdi6eBw0hBD4YtC7MtK+E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(9686003)(186003)(82740400003)(47076004)(316002)(356005)(70206006)(70586007)(81166007)(86362001)(5660300002)(8676002)(336012)(33656002)(2906002)(26005)(55016002)(52536014)(8936002)(110136005)(6506007)(7696005)(82310400002)(4326008)(478600001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 07:26:59.2762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b363fb7-70a8-4d9b-dce3-08d835231c98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2841
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon Mason,=0A=
=0A=
Can you please apply this patch as well ?=0A=
=0A=
Regards,=0A=
Khasim=0A=
=0A=
________________________________________=0A=
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Khasim Mohammed via lists.yoctoproject.org <khasim.mohammed=3Darm=
.com@lists.yoctoproject.org>=0A=
Sent: Thursday, July 23, 2020 5:25 PM=0A=
To: meta-arm@lists.yoctoproject.org=0A=
Cc: nd; Khasim Mohammed=0A=
Subject: [meta-arm] [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP =
components=0A=
=0A=
Add build-time dependencies to ensure the required components=0A=
(TFA, SCP, UEFI EDK2) are built and available before=0A=
the task to create wic image gets initiated.=0A=
=0A=
Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3=0A=
Issue-Id: PLATFORMS-3134=0A=
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>=0A=
---=0A=
 meta-arm-bsp/conf/machine/n1sdp.conf | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf=0A=
index 139f619..d651270 100644=0A=
--- a/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf=0A=
@@ -17,6 +17,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"=0A=
=0A=
 # Set default WKS=0A=
 WKS_FILE ?=3D "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "syste=
md-bootdisk.wks", "mkefidisk.wks", d)}"=0A=
+WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"=0A=
=0A=
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)=0A=
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"=0A=
--=0A=
2.17.1=0A=
=0A=

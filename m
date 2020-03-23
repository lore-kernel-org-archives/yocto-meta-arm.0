Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.56])
 by mx.groups.io with SMTP id smtpd.web10.53888.1584973625287332048
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yoCTedVV;
 spf=pass (domain: arm.com, ip: 40.107.3.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxxL+3OVD1Cww4bh7tqUdtdwuFTywKpdp33EDK2xFLY=;
 b=yoCTedVV0H7uO3KD1q+uCj5UbTR7duGM7KLRQZf1KzVz5OS0tt1qmWF05RP1HjXjnyoiDSp7E1RI9v8gmGnejEahdmchQmXW2yLhmjIZ8T3rsQVn6DV2yqf65mHmrTFmYtfU3HF6f2B3+ElnN1SlYVGm9gril3NgCFkmh9iqS2c=
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 14:27:02 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::39) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Mon, 23 Mar 2020 14:27:02 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:27:02 +0000
Received: ("Tessian outbound 88ba19940385:v48"); Mon, 23 Mar 2020 14:27:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a646eaee78fb0ba
X-CR-MTA-TID: 64aa7808
Received: from 86c364dc452a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D3F5A7B8-D00C-4CF2-90A7-E05CA8BEAC37.1;
	Mon, 23 Mar 2020 14:26:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86c364dc452a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxuYMRoguojO37yBt46ADFAz/yVWiF/JMKj+gJSRt43HRydPla3GVbcDeRzlS80f5SQ3ENa5qOwMi8yKCsxwuORg7dpTeav+k+bM+dpHnoQn02CZKjBfdYrqnRHJdboFeWRk7HRxXZlZM4BTxQaaq6zXiAzcgk2jp4wHobt96676TBXl24WNxjdq4FJYBlD5FL5u6uVvcGibplcUUVPc8J4kvb8WEoTiEh3LWSDDEEgiP4miE1QeQBUxQi1GWroG0L/28ek7WYvSysBNfwMaBA4NFi3hlYL/bwTHPmuIxdH+PHjsr0qVUmYbbewOdwH568PKFo7XnYXZdJI6UzM73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxxL+3OVD1Cww4bh7tqUdtdwuFTywKpdp33EDK2xFLY=;
 b=atDbDLcrmSvX/PSQoyEY1Q7IEpy6l5SOsYY9vq7WiLvfqW1ucfHJkvBvn5Tnd/SMEo0sp34+eYUEwYvCZmemxNRoZyUrFQJhPb/kDydm7dWo8+z2EvnXpiPyx0+tyR/CrA0/YePk4oeQHbU+eT5mMid1gF0OaTmPPZ/YaXqXiDd6oct7hw3+aJEvxrtSs93epjl89el1UjeZSwtBtVmPXtu4DiqpmWLK2Thsgzxp78FiDedcnJrAw2jUmByQKJSocXPtFlfDsyFmSSD3ij/I7Hb7suwtdFmND1s0F437AOAptvLD9KzIYGc64qOhH1w79MtGiotSwdB1HnVRymyw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxxL+3OVD1Cww4bh7tqUdtdwuFTywKpdp33EDK2xFLY=;
 b=yoCTedVV0H7uO3KD1q+uCj5UbTR7duGM7KLRQZf1KzVz5OS0tt1qmWF05RP1HjXjnyoiDSp7E1RI9v8gmGnejEahdmchQmXW2yLhmjIZ8T3rsQVn6DV2yqf65mHmrTFmYtfU3HF6f2B3+ElnN1SlYVGm9gril3NgCFkmh9iqS2c=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3612.eurprd08.prod.outlook.com (20.177.120.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 14:26:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:26:54 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Topic: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Index: AQHWAR5vYBNzgcxgmUihs6zn4WJ0yahWO/YA
Date: Mon, 23 Mar 2020 14:26:54 +0000
Message-ID: <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
In-Reply-To: <20200323142146.30350-1-jon.mason@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c57b351d-0c30-4248-39a8-08d7cf364133
x-ms-traffictypediagnostic: DB7PR08MB3612:|HE1PR0801MB2058:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB2058E91E350A49A04622AA7C9DF00@HE1PR0801MB2058.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
x-forefront-prvs: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(199004)(6486002)(2616005)(8676002)(53546011)(6506007)(5660300002)(36756003)(2906002)(316002)(6512007)(186003)(33656002)(86362001)(64756008)(66476007)(66446008)(66556008)(4326008)(966005)(81166006)(81156014)(76116006)(66946007)(8936002)(478600001)(6916009)(91956017)(26005)(71200400001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3612;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IFkUeRa1FND/k8TMcJupoyzRQc+w4GjQNfnCkLE0fSr4jPdCfYfaPvjFQmmIEe2UYD4Du3iic/ftIp9ll5s9iDJLvQ/CpF5WjW7YGURGzzUvw92zgcUXYOF0Wbl4q0dedmXT28IeVPgGmBVWNleNDFgzxgCJnf1szC/pIIyMlW1xK+gzWU39EPsqB4K2FlgVKPODknSiZCZUaZWGGWgvYOfuZ1HZaVcDZVyv5/4nUm4ArGCbpkyTcqF90uT/Dq7g7K8anO8JyFLyG23tFgvQCzOqIDPDlhPhFBdiLYIMuLpFGW+FKyb9x0sqdQfHP+ot2WkUoFfiRA+koFmcHFuydnBXZQb+VtE3FipjjOJFo65CmQEQ1/BUIIrsdg4Tyra6HzmAl0WPOAlVZq8I+44zqYX1ugudkkWIe53JWehEVvEHMLcuDdDnGUTgF6oi5mub+PxJUCDi9eCJzUKZbrVc1VxDzpAZFf/IUI9YSDmJeiLD3DK05EIqjm1bVCXAJPgg1pKqQE3T/bUngUdoHDAC0d9eVvKKobmn7d8aQ4qcrLPCquRSr7mjO+eICMmMpdh7
x-ms-exchange-antispam-messagedata: 
 AaDKebycxi4/6/CWLcEFvSDY3E1EPNzoA+uCvvn/EYYVGBeYhzA6k3WOsAQ7GL2VtKnKyYKgJ9OEhE3TxMrkAcdzoEUHMgYJrXqYmVbCLe7R55sM6yMUG0HRj/ncWc8Pr81EeMUZJE4Ryu4gkx81fg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3612
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(39850400004)(136003)(199004)(46966005)(2616005)(45080400002)(186003)(478600001)(33656002)(336012)(47076004)(26826003)(6916009)(26005)(86362001)(36756003)(966005)(6512007)(70206006)(70586007)(36906005)(6506007)(53546011)(81166006)(5660300002)(316002)(8936002)(81156014)(4326008)(356004)(8676002)(2906002)(6486002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2058;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a5bc9b24-c6e7-47dd-6df5-08d7cf363c9f
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0xbAvyBWNuQhktVOGzWLr2zyp/v9cySnsuLB3vUKiJ4D0qT3EFWcB1gr8GV29surm4fee4y1tHP+i2EzgoJCqGuOnCCRMKpFpeD8i1QCh+5S9ZonmTgHoL0WENa5TFzQynU0jBre22BLHOrQ0Sh9/ju8BIQY9/HFpetFAFl3TLd0Tq26WJiBODEypzXFevIcJJsfHf9dS8rfdWdzEEaYFLlo5+36R0L+ao+x4VTW5efSpv7C4lNrFCDho73K16RoZwxAAavyKM6Cf9xCuwfDhUDCkgGAvbqF8ZHaT0JuBqFNYW59XVPm16PvCUG+6mYTYVAoaz/YeJSsgqDfDs+9C5gA+WufDlqMEFiCHtPH2tcBHhagQqlgjcMjpdyCqcNBlDybV7m4LIrecKYDz5s0sOaeWdQ8jZPw/ou4SkBwQk0Xc+p15dM/jgbFWp6o+uzm4zSDYkPrLSMuQ4IZzE52ChR1cpbPxh7VNbIZsqui1Id49+jKPbk4B9qGp7OqTk+/gZxvcywwyaclEa2kBYrPSMNoYVBbMPzL60Bl+3GiYAKpjXG4lGWwEVkK9xw78DwFuf/5QrAotkG75Sw13p4SgUht517hLouUkvXW2dIzl04=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:27:02.4203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c57b351d-0c30-4248-39a8-08d7cf364133
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2058
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DF3127613229498A8A747F95875AE6E8armcom_"

--_000_DF3127613229498A8A747F95875AE6E8armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 23 Mar 2020, at 14:21, Jon Mason via Lists.Yoctoproject.Org<http://List=
s.Yoctoproject.Org> <jon.mason=3Darm.com@lists.yoctoproject.org<mailto:jon.=
mason=3Darm.com@lists.yoctoproject.org>> wrote:

The current WIC references in the A5DS config file are causing a build
break, due to not being defined.  These WIC files should be revisited
once the IOTA distro is present.

Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a
Signed-off-by: Jon Mason <jon.mason@arm.com<mailto:jon.mason@arm.com>>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marqu=
is@arm.com>>

---
meta-arm-bsp/conf/machine/a5ds.conf | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machi=
ne/a5ds.conf
index 136105b..fa7d88e 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -14,7 +14,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-bo=
ot"

SERIAL_CONSOLES =3D "115200;ttyAMA0"

-IMAGE_FSTYPES +=3D "tar.bz2 wic wic.nopt cpio.gz"
+IMAGE_FSTYPES +=3D "tar.bz2 cpio.gz"

EXTRA_IMAGEDEPENDS +=3D "u-boot"

--
2.17.1




--_000_DF3127613229498A8A747F95875AE6E8armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <89C0F4EB8F5DDC4B9E5944ABCA3D5B61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break=
: after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 23 Mar 2020, at 14:21, Jon Mason via <a href=3D"http://=
Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:jon.mason=3Darm.com@lists=
.yoctoproject.org" class=3D"">jon.mason=3Darm.com@lists.yoctoproject.org</a=
>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">The current WIC references in the A5DS config file are cau=
sing a build<br class=3D"">
break, due to not being defined. &nbsp;These WIC files should be revisited=
<br class=3D"">
once the IOTA distro is present.<br class=3D"">
<br class=3D"">
Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a<br class=3D"">
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" class=3D=
"">jon.mason@arm.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
Acked-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com"=
 class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
meta-arm-bsp/conf/machine/a5ds.conf | 2 &#43;-<br class=3D"">
1 file changed, 1 insertion(&#43;), 1 deletion(-)<br class=3D"">
<br class=3D"">
diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machi=
ne/a5ds.conf<br class=3D"">
index 136105b..fa7d88e 100644<br class=3D"">
--- a/meta-arm-bsp/conf/machine/a5ds.conf<br class=3D"">
&#43;&#43;&#43; b/meta-arm-bsp/conf/machine/a5ds.conf<br class=3D"">
@@ -14,7 &#43;14,7 @@ EXTRA_IMAGEDEPENDS &#43;=3D &quot;virtual/trusted-fi=
rmware-a u-boot&quot;<br class=3D"">
<br class=3D"">
SERIAL_CONSOLES =3D &quot;115200;ttyAMA0&quot;<br class=3D"">
<br class=3D"">
-IMAGE_FSTYPES &#43;=3D &quot;tar.bz2 wic wic.nopt cpio.gz&quot;<br class=
=3D"">
&#43;IMAGE_FSTYPES &#43;=3D &quot;tar.bz2 cpio.gz&quot;<br class=3D"">
<br class=3D"">
EXTRA_IMAGEDEPENDS &#43;=3D &quot;u-boot&quot;<br class=3D"">
<br class=3D"">
-- <br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_DF3127613229498A8A747F95875AE6E8armcom_--

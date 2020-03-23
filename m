Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web10.54901.1584975959120097001
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 08:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GkVoY40l;
 spf=pass (domain: arm.com, ip: 40.107.8.47, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFi6q/1FWH56i3MnbyDo+JuVOdITzRNNPKLjp9KC/t8=;
 b=GkVoY40l7iwSCxN9AYR9RmEQw2BmV3q0/XF1z9Fl/Nz/r3EZApfvzfJ3blUAHXZN2UUMNxfD+6LK9J3REE95wgjQWiUXlbNdtwZiB5qQCAXnuwdlEE4kUFWa+JS9e+163+p0u515KtJeMxbRRyjbhv/sG3G8UnS9FNOj1nLiwfw=
Received: from AM6PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:92::42)
 by DB7PR08MB3036.eurprd08.prod.outlook.com (2603:10a6:5:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 15:05:55 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::43) by AM6PR04CA0029.outlook.office365.com
 (2603:10a6:20b:92::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Mon, 23 Mar 2020 15:05:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 15:05:54 +0000
Received: ("Tessian outbound 88ba19940385:v48"); Mon, 23 Mar 2020 15:05:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f716deb2c195e35
X-CR-MTA-TID: 64aa7808
Received: from 1b1f73325c3e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9022EE4F-F2FD-4AC4-9F93-BE3365A1AA0C.1;
	Mon, 23 Mar 2020 15:05:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b1f73325c3e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 15:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi0OGyQTmKYLDuEZ0TtwWO1dyUcU7q41ZJDF4SJsm7/XcRRWj0TCY+QJIStaKJ7fcRxW3UVlxrRVyCRE1nTYBnb5vyf7v0/aB6wqQZ2IHDnow1fCU8ioPbdPwLfZPjI2VShCjqA2OdR6C8y7FEPj79Fwte6XGRaG1g1ENrIXN3l00IvDV+g6VFh8aHjJM4TcVR+AMe19+NLwYxhHZbuDN1KzWPQ+WIFyRN0+zM/igL0DT9suYl1RENuPkbh+xNmvvRIXnY2OzQb8a11L8vrD78y8Bfd5YAUwCrIdlyAgnVt0PXIGHbm1Lc8Ituhm/Ca7A8ZeLWHKk/8NYLUplq0O5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFi6q/1FWH56i3MnbyDo+JuVOdITzRNNPKLjp9KC/t8=;
 b=CIXFmHYP/UzsRPKkgm8juu84ty7+s8uFPtl3jAO7UQqgLSqeTLNjqfVatq+2ArTCl1pnI7IGuqC4n6rxJTxwa5QVYM8tB3Sn3LgdUxk15hRZnB9j2TGrXlYJJ0JS4E4UMH+HCmeOD6pYKW7EgsN5nweG6nY4Ltg4DanM6FGHzIG4bMSsZ4EKG58x5PTEIP2NXw4ZYbLLvSHVE25JQMe0Q4aTPHYzixEeTeJOzpcjxVMQMTsOTl0MEmWkNDj6LL4okOCc+2TNV7gnME+SReqri5nmTjoDzYegAxnETsx0kH+uQ/ssH2+O+ZaN8QOBk1L7bbTMtdhnldqdTysfSbUSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFi6q/1FWH56i3MnbyDo+JuVOdITzRNNPKLjp9KC/t8=;
 b=GkVoY40l7iwSCxN9AYR9RmEQw2BmV3q0/XF1z9Fl/Nz/r3EZApfvzfJ3blUAHXZN2UUMNxfD+6LK9J3REE95wgjQWiUXlbNdtwZiB5qQCAXnuwdlEE4kUFWa+JS9e+163+p0u515KtJeMxbRRyjbhv/sG3G8UnS9FNOj1nLiwfw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3370.eurprd08.prod.outlook.com (20.176.238.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Mon, 23 Mar 2020 15:05:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 15:05:46 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Topic: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Index: AQHWAR5vYBNzgcxgmUihs6zn4WJ0yahWO/YAgAAEGoCAAAbBgA==
Date: Mon, 23 Mar 2020 15:05:46 +0000
Message-ID: <A971EE15-E603-474B-9058-B4571B8A59D9@arm.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
 <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
 <CAPoiz9zwDXOtLXi9SCw7ARthAcFf8f8mRmhOsMC2g1TPCzh+tQ@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9zwDXOtLXi9SCw7ARthAcFf8f8mRmhOsMC2g1TPCzh+tQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a26366a7-3584-43be-54b6-08d7cf3baf4b
x-ms-traffictypediagnostic: DB7PR08MB3370:|DB7PR08MB3036:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB303685D523096D0982BFC4349DF00@DB7PR08MB3036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(199004)(2906002)(6512007)(5660300002)(6506007)(53546011)(4326008)(478600001)(2616005)(966005)(316002)(36756003)(86362001)(81156014)(6916009)(81166006)(33656002)(6486002)(26005)(66446008)(71200400001)(66556008)(8676002)(8936002)(76116006)(64756008)(66476007)(91956017)(66946007)(186003)(32563001)(559001)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3370;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LCO2lEHquJgmiYVLde0ihR4Zd38n6GYFQCLS8JlpILER4AHTgW1fRZJ4Y9BJnqvh39cMlN0AEBTQuLk5DBh9cCbe578Ve0xo4jnCoqwvJtmuNrmHHSJ93/9ysjlwCBvGbeL5ztYatGlPEQxBQIqke3LRKmRCNgUGR5HiVaPB1uwmrRhgrhbZLyEUO0pcAmt1CJO58Wu8SeGq07blIhEEGdbJzE6o9UlRyEkZvZXE88beD1Y7t66+/e3i0ML9QSNNtgg0r7+J6ddFQAq/8NgxTwPbuURrmxe+Ykmxxz0owBQPUq7FBIoqdxGssbfQEw/2bJdCfC9NT7X4oVLtYvmN1bq+Y4VoiEoB/xq491HNcZs26gMMtwLPH33AWBeyFJ6sNEYGdz0jteOaJbBGFocCASiIFBmV9GrHFqtQj7W2TgKEboOpADFy7lKarGyJiF2PBg0+2+3NEQRAObxvVWKuiOXyr5RdKzRcbyuABpt+grlSQ0js5E8EnsKH9/YzaqPW6EBXSpOl9xQPgw1lJbS7nG5l5aAbX5MxqTq4CVZ3rLPOYXpBhXQwKsdor/yLrNEZ
x-ms-exchange-antispam-messagedata: 
 WwqYmIEIIBiA/bOgd3waN+wzHKBZ9Il0q3WKL9mcwuzrSxtg4eTtsAHsQgRoRA84eEdRUVLbFNR2HnEOspyESW/85ibOTSCSb7oJXLc8hiwcMFP8ju+zTkGFyfQa7miRUdPJrTgWpqpDDaExEL2Psw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3370
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(199004)(46966005)(186003)(8936002)(36756003)(26005)(26826003)(81156014)(86362001)(478600001)(966005)(8676002)(81166006)(70206006)(5660300002)(70586007)(45080400002)(33656002)(6916009)(2906002)(6486002)(2616005)(6506007)(53546011)(36906005)(4326008)(47076004)(6512007)(356004)(336012)(316002)(32563001)(559001)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3036;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9432e0ca-ccbc-4773-951a-08d7cf3baa2b
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sUhDuO7EW2hFu3jD9p6Xv6K8/y9N5H8+eYypohlezH3V44t1tckGTdr6vyRnjJFkSFbGAf0sX0UZHXWX/vV2YrMtls78QQQQaLRjRQXoDddJ7BtLPOf8QraK0erKFyB4uVKTFnzWdarpRtICKgO9B9Q/wZjRJ31J3jS7uzL3v1PVrWulg+M77QZ8Rvk+zaECt/PH3Qr9zSA3s9yFYdh70tHeL81+X5q+c3guObIsequ0qhptlS4VY+EfXrMKQZS/fXOA1Sxf2N2o44xWuLxY/FAHmsWGiDttNCVASZ+KzWGstKgEFXPeA0zss+jms4VrXqIYcOosiPkFPBxAQqy5iUVOLUFKnbC4PTlUhiRJRuojgLV8jv+tLL+7Jsn/zlw/Hd7wm4xYgmOCJ4Wwy1mo4l5sG0B6+ifTA7V/Vi9yJPdcfokFrmMPEXkxqN/iEvD4wCDVPb4AhWhmW5Yu16G12cXBQ4W97IKh9P60zdJLGD0bk1hAWVuDxHepQhk9urChnJpBX57fgm8d7idz0Pdb4z6bBWndXsHpMydMMvkT63Sdv0CsE8iaHmJBq/dIMN8P/zGZjH76Qym0wexK58Otq7Yxm54OKVw8GHatmIB1OAs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 15:05:54.5793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26366a7-3584-43be-54b6-08d7cf3baf4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3036
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A971EE15E603474B9058B4571B8A59D9armcom_"

--_000_A971EE15E603474B9058B4571B8A59D9armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 23 Mar 2020, at 14:41, Jon Mason via Lists.Yoctoproject.Org<http://List=
s.Yoctoproject.Org> <jdmason=3Dkudzu.us@lists.yoctoproject.org<mailto:jdmas=
on=3Dkudzu.us@lists.yoctoproject.org>> wrote:

On Mon, Mar 23, 2020 at 10:27 AM Bertrand Marquis
<bertrand.marquis@arm.com<mailto:bertrand.marquis@arm.com>> wrote:



On 23 Mar 2020, at 14:21, Jon Mason via Lists.Yoctoproject.Org<http://list=
s.yoctoproject.org/> <jon.mason=3Darm.com@lists.yoctoproject.org<mailto:jon=
.mason=3Darm.com@lists.yoctoproject.org>> wrote:

The current WIC references in the A5DS config file are causing a build
break, due to not being defined.  These WIC files should be revisited
once the IOTA distro is present.

Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a
Signed-off-by: Jon Mason <jon.mason@arm.com<mailto:jon.mason@arm.com>>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marqu=
is@arm.com>>

Thanks Bertrand.  I think you mean Reviewed-by though.  Per the Linux
kernel process (which I believe Yocto/OE follows):

From Documentation/SubmittingPatches

<snip>
Acked-by: is often used by the maintainer of the affected code when that
maintainer neither contributed to nor forwarded the patch.
</snip>

<snip>
Reviewed-by:, instead, indicates that the patch has been reviewed and foun=
d
acceptable according to the Reviewer's Statement:

       Reviewer's statement of oversight

       By offering my Reviewed-by: tag, I state that:

        (a) I have carried out a technical review of this patch to
            evaluate its appropriateness and readiness for inclusion into
            the mainline kernel.

        (b) Any problems, concerns, or questions relating to the patch
            have been communicated back to the submitter.  I am satisfied
            with the submitter's response to my comments.

        (c) While there may be things that could be improved with this
            submission, I believe that it is, at this time, (1) a
            worthwhile modification to the kernel, and (2) free of known
            issues which would argue against its inclusion.

        (d) While I have reviewed the patch and believe it to be sound, I
            do not (unless explicitly stated elsewhere) make any
            warranties or guarantees that it will achieve its stated
            purpose or function properly in any given situation.

A Reviewed-by tag is a statement of opinion that the patch is an
appropriate modification of the kernel without any remaining serious
technical issues.  Any interested reviewer (who has done the work) can
offer a Reviewed-by tag for a patch.  This tag serves to give credit to
reviewers and to inform maintainers of the degree of review which has been
done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
understand the subject area and to perform thorough reviews, will normally
increase the likelihood of your patch getting into the kernel.
</snip>

So in this case, probably the only "Acked-by" would be the author of
the original patch, Rui Silva.  Everyone else should do a Reviewed-by.

Agree
Bertrand


Thanks,
Jon


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







--_000_A971EE15E603474B9058B4571B8A59D9armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <2871DF3CC0DC334582224DFEECBFB902@eurprd08.prod.outlook.com>
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
<div class=3D"">On 23 Mar 2020, at 14:41, Jon Mason via <a href=3D"http://=
Lists.Yoctoproject.Org" class=3D"">
Lists.Yoctoproject.Org</a> &lt;<a href=3D"mailto:jdmason=3Dkudzu.us@lists.=
yoctoproject.org" class=3D"">jdmason=3Dkudzu.us@lists.yoctoproject.org</a>&=
gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">On
 Mon, Mar 23, 2020 at 10:27 AM Bertrand Marquis</span><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&lt;</span><a href=3D"mailto:bertrand.marquis@arm.com" style=3D"fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-te=
xt-stroke-width: 0px;" class=3D"">bertrand.marquis@arm.com</a><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none; float: none; display: inline !important;" class=3D"">&gt=
;
 wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
On 23 Mar 2020, at 14:21, Jon Mason via<span class=3D"Apple-converted-spac=
e">&nbsp;</span><a href=3D"http://lists.yoctoproject.org/" class=3D"">Lists=
.Yoctoproject.Org</a><span class=3D"Apple-converted-space">&nbsp;</span>&lt=
;<a href=3D"mailto:jon.mason=3Darm.com@lists.yoctoproject.org" class=3D"">j=
on.mason=3Darm.com@lists.yoctoproject.org</a>&gt;
 wrote:<br class=3D"">
<br class=3D"">
The current WIC references in the A5DS config file are causing a build<br =
class=3D"">
break, due to not being defined. &nbsp;These WIC files should be revisited=
<br class=3D"">
once the IOTA distro is present.<br class=3D"">
<br class=3D"">
Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a<br class=3D"">
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" class=3D=
"">jon.mason@arm.com</a>&gt;<br class=3D"">
<br class=3D"">
Acked-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com"=
 class=3D"">bertrand.marquis@arm.com</a>&gt;<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Thanks
 Bertrand. &nbsp;I think you mean Reviewed-by though. &nbsp;Per the Linux<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">kernel
 process (which I believe Yocto/OE follows):</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">From
 Documentation/SubmittingPatches</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&lt;snip&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: nor=
mal; font-weight: normal; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Acked-by:
 is often used by the maintainer of the affected code when that</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">maintainer
 neither contributed to nor forwarded the patch.</span><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&lt;/snip&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&lt;snip&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: nor=
mal; font-weight: normal; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Reviewed-by:,
 instead, indicates that the patch has been reviewed and found</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">acceptable
 according to the Reviewer's Statement:</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reviewer's
 statement of oversight</span><br style=3D"caret-color: rgb(0, 0, 0); font=
-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps:=
 normal; font-weight: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;By
 offering my Reviewed-by: tag, I state that:</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a)
 I have carried out a technical review of this patch to</span><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;evaluate
 its appropriateness and readiness for inclusion into</span><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;the
 mainline kernel.</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b)
 Any problems, concerns, or questions relating to the patch</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;have
 been communicated back to the submitter. &nbsp;I am satisfied</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;with
 the submitter's response to my comments.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(c)
 While there may be things that could be improved with this</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;submission,
 I believe that it is, at this time, (1) a</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;worthwhile
 modification to the kernel, and (2) free of known</span><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;issues
 which would argue against its inclusion.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d)
 While I have reviewed the patch and believe it to be sound, I</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;do
 not (unless explicitly stated elsewhere) make any</span><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;warranties
 or guarantees that it will achieve its stated</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;purpose
 or function properly in any given situation.</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">A
 Reviewed-by tag is a statement of opinion that the patch is an</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">appropriate
 modification of the kernel without any remaining serious</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">technical
 issues. &nbsp;Any interested reviewer (who has done the work) can</span><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">offer
 a Reviewed-by tag for a patch. &nbsp;This tag serves to give credit to</s=
pan><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-si=
ze: 12px; font-style: normal; font-variant-caps: normal; font-weight: norma=
l; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">reviewers
 and to inform maintainers of the degree of review which has been</span><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">done
 on the patch. &nbsp;Reviewed-by: tags, when supplied by reviewers known t=
o</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">understand
 the subject area and to perform thorough reviews, will normally</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">increase
 the likelihood of your patch getting into the kernel.</span><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">&lt;/snip&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">So
 in this case, probably the only &quot;Acked-by&quot; would be the author =
of</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">the
 original patch, Rui Silva. &nbsp;Everyone else should do a Reviewed-by.</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Agree</div>
<div>Bertrand</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Jon</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -we=
bkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D"">
<br class=3D"">
---<br class=3D"">
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
--<br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D""></span></div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_A971EE15E603474B9058B4571B8A59D9armcom_--

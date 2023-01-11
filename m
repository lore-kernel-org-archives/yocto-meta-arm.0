Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B182C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 09:22:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web10.19746.1673428965403801218
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 01:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xEc8e8VF;
 spf=pass (domain: arm.com, ip: 40.107.21.85, mailfrom: emekcan.aras@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K/J0koJ57jr4437cyJGLdl8aTzGZmjmgJ3T8fGd0dM=;
 b=xEc8e8VFvvuB+VBE0UMmIoIj09cHl5qTRCElraO2VyvoRcAwwj1RDODly3/Q5SFXi43ADzveVIC2l5ZcVYL80QxWTsNLYgpWSFoIoR5b+dL8HMwzzABXIkPaHIbcHD70jVD1mJXtWMNIuubW7ip0RuYhkq9EIxq8ZiWUKEW4wwY=
Received: from AM5P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::27)
 by AS8PR08MB6040.eurprd08.prod.outlook.com (2603:10a6:20b:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 09:22:41 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::df) by AM5P194CA0017.outlook.office365.com
 (2603:10a6:203:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 09:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 09:22:40 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Wed, 11 Jan 2023 09:22:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c347d85989d5ed13
X-CR-MTA-TID: 64aa7808
Received: from abb85fb21443.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DE1C2420-1020-480C-B724-D17068F92157.1;
	Wed, 11 Jan 2023 09:22:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abb85fb21443.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Jan 2023 09:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzzt9QTWhtDeSPKvZdh4F5kw6JN5nL+IBAybQu0vuIDranXwCur4uI6XharYX76UOaK6qVD0aq2Mu0N7tUBCa/jLEHuNwP8p1QWyCY3h6wFw+oYaWX3ov8L1xsIy+gX0id57p4JNguBaBT6qvLxrgVA9FVmhy1ej9sMO/P3puSsymZ1tWsBKQNCzi5GqLSe7p5d0JUuUtv6y0UoCAIIv/DV3fVdDlmjOFkLYUgdWZcXjVhTxgOPHcp1AdMVnPQMh0oUZrF4cuOCShvwTq3Q8806XBUhn4dJ6/l6YXox/0cmt6HLpnbfqsI/+dCSwseJBiPj4gFAc9M2h0QVwbIunLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K/J0koJ57jr4437cyJGLdl8aTzGZmjmgJ3T8fGd0dM=;
 b=f5Kw6K5rUjzBTHeS6btn4DvSUaYr2IUkoELe9XLDvTTggVlhCvXhY1+PNu3gHY8axLhBp9aFXsIAX4HRT7bQd+q3iRO0Apvfr1m04lNSL5IDdduXzIq3h6G+Pe9JOIuJwFE3Xj2B53RbMh1qCTIrH+kHTZfa8CN85JfY+eM0WCPOqciaBwrjpBR3Sog6Fjjki2G877kleqY/TVhNI4xBIx+KDE1uOy1irK/NvRyxmvDDrocvQn0c7eOAYaKm0qTxtlZ6vARb4OTt0mUGJpUNkHa9EfOxAw4KoJ69JqsrOhLkAvzhAeSRDSfOsFDWJk5jE7YlZJSnhAGMya99X5TDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K/J0koJ57jr4437cyJGLdl8aTzGZmjmgJ3T8fGd0dM=;
 b=xEc8e8VFvvuB+VBE0UMmIoIj09cHl5qTRCElraO2VyvoRcAwwj1RDODly3/Q5SFXi43ADzveVIC2l5ZcVYL80QxWTsNLYgpWSFoIoR5b+dL8HMwzzABXIkPaHIbcHD70jVD1mJXtWMNIuubW7ip0RuYhkq9EIxq8ZiWUKEW4wwY=
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com (2603:10a6:10:f6::10)
 by AS2PR08MB8575.eurprd08.prod.outlook.com (2603:10a6:20b:55e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 09:22:27 +0000
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d]) by DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d%7]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 09:22:26 +0000
From: Emekcan Aras <Emekcan.Aras@arm.com>
To: Jon Mason <jdmason@kudzu.us>, Ross Burton <Ross.Burton@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH 2/5] arm/optee: support optee 3.19
Thread-Topic: [PATCH 2/5] arm/optee: support optee 3.19
Thread-Index: AQHZFUofGr/mGvywXUq53Zu+mMnel66QCqIAgAfujoCAARhkiw==
Date: Wed, 11 Jan 2023 09:22:25 +0000
Message-ID: 
 <DBBPR08MB4838A51C624195B5FCEDD03A8EFC9@DBBPR08MB4838.eurprd08.prod.outlook.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
 <7DEFE610-F0A9-44D3-AAAB-2B7E7919669B@arm.com> <Y72UYV/BG39wEykn@kudzu.us>
In-Reply-To: <Y72UYV/BG39wEykn@kudzu.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DBBPR08MB4838:EE_|AS2PR08MB8575:EE_|AM7EUR03FT014:EE_|AS8PR08MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: d3684b36-a5ee-4ce5-b2b2-08daf3b5634c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3KiLSTdni5ZyEIxBRFYz6zs2vWhWhMvE2RQv1T1WhwJTWQozTxvvPGWN9qnoVUsvUi2sQvsBXtVVg+NWqfb50AEaVfvjZMTD5YMCwuVaRWfwkO8dv4Ril/tsPOP9KQoE8wh343HIZSfsKW677urEty91P73rxRGxmAkOJwtxo83cpJ2BljW+pyJTvUsk4mHP3YujjWHAfyPcdWKUbKz9AMF5gpYNHFS0OJP7YTzd9N//EBvTm8vh1uIP0H873n650vYfzFR57qlLTa1iX3qpFGGevNXxEYExhS+g+Vp/LTTM/hz0moevW4ckLyLfN7cxYpl7h2Nwh469ZEULSCM4d+M2rvA9Vo4v+O9ijZpEARlzK1yJ7mw1oTTA3acsO2ULk/CtY8dY5MgxIUaDPPgjcStTWd7nT6aiofcm5TPuDqMTTR21O6POxRZijjxFo9UjmXtB6+XlXQv9Bnj0zFbidswIAU7Vs7O3632h+2QiUaFxceDB73p/oXoaMgE+pjLtCqCxTG6QRxXh1A9JvjNzPKXPQHHgUrroGTs9HrwWVWVYiR6wL6GHuJS3YQ88bnviz7og6q+aG73c+nA0Z0XPZl/2CwKMRntAk/xbpZ87alQRafZWI5hkZxLJB0CkdlchfJBzja++I5bway6ZSAl1VuzfRCx4fELcNIF3ixcbZqBN72WD09x0NaM2yt6U9kpxTe8FzMzVdoRHQI5BhYhlcQUzrW1yuAQMIfn/S1Vf83M=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4838.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(55016003)(9686003)(26005)(186003)(66446008)(52536014)(38100700002)(8936002)(478600001)(83380400001)(33656002)(2906002)(316002)(6636002)(38070700005)(76116006)(110136005)(66946007)(66556008)(8676002)(4326008)(64756008)(71200400001)(7696005)(5660300002)(91956017)(66476007)(166002)(19627405001)(6506007)(53546011)(41300700001)(86362001)(122000001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_DBBPR08MB4838A51C624195B5FCEDD03A8EFC9DBBPR08MB4838eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	360ed6a5-a35c-416b-8767-08daf3b55a0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sSYPYJdMHiTKzCUWD040PGioF/L/yyFu+rMUzP0Q1+5qa61ieWqoqDEu8VfkBrnvw+bxk6+ClGLj987yMvLPPDTkz+gl5BU8nCy/18x6A9jW0KbcWtDd47UOQC4RSip5wfNQAf7SpgCpK6EZBAr35Orv6C9L1uKfOULZaOsytFfAFe+NlyIav5wWWDCtKnNR/6TxCLUoOsn24c+ADn39t3MWridIGuXLzzevqzIUe3fMQe9DyRS5m7MTJT17ee0RWXiDam3M3YPvOzUXWfQ5XYFvdG3IjqGWUlqLiTChBRWGnFfS5P1jB23FMfQOyS2VJR9si9Xpp+CyJX7I9QVj7v0pen5N7S4PqSY/XhBzIjpX9iT7/aiIBdv114dmXgJINdfI3WxJM9vVNxIUr8ubnRK/3YoAp5kvTBPBHKzeqYH/rAGjz2gWIw4Rm/iZw4Aq0qDoB3nHapXQfcwu/Bu62P5fDdm4ura0eQv/KHWoMrPsgIrDby4mXT5xJA9ZRe+pJFDc0zZlcghCmbY2XvOO4qsQqVOIOZMr8Hig9rkNpVtgVn1nIopPbh8bx14r2YE7Zm24zwDNNMtMrDhjlMvB+g/BRutE8maMNbwykgYyB72xmQ4xNV6Mg9zs3Z/1w2D9kQMOe7MpmwVYAjiwttvYFcLEBOdw8/WdYWjzrwUxlsubBPJIkNDlyaA+YZXksAsGmugGOxYoistGqtksQzZo0G7a42b9bqWVCWey2jdIgrk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(33656002)(70586007)(4326008)(8676002)(356005)(5660300002)(8936002)(70206006)(7696005)(41300700001)(9686003)(186003)(478600001)(6636002)(110136005)(26005)(81166007)(53546011)(55016003)(82740400003)(6506007)(166002)(52536014)(40480700001)(47076005)(86362001)(316002)(40460700003)(336012)(82310400005)(2906002)(19627405001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:22:40.6166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3684b36-a5ee-4ce5-b2b2-08daf3b5634c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6040
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jan 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4259

--_000_DBBPR08MB4838A51C624195B5FCEDD03A8EFC9DBBPR08MB4838eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Tuesday, January 10, 2023 4:37 PM
To: Ross Burton <Ross.Burton@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>; meta-arm@lists.yoctoproject.org <m=
eta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH 2/5] arm/optee: support optee 3.19

On Thu, Jan 05, 2023 at 03:30:14PM +0000, Ross Burton wrote:
> > +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> > @@ -0,0 +1,82 @@
> > +SUMMARY =3D "OP-TEE Trusted OS"
> > +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted=
 side of the TEE"
> > +HOMEPAGE =3D "https://www.op-tee.org/"
> > +
> > +LICENSE =3D "BSD-2-Clause"
> > +LIC_FILES_CHKSUM =3D "[file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee5=
5ec173]file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec173"
> > +
> > +inherit deploy python3native
> > +require optee.inc
>
> =85
>
> This file is 99% identical to optee-os.inc apart from FILEEXTRAPATHS, so =
put that assignment in the .bb and include the common optee-os.inc.
>
> Whilst I=92m there=85
>
> > +do_compile:prepend() {
> > + PLAT_LIBGCC_PATH=3D$(${CC} -print-libgcc-file-name)
> > +}
>
> This doesn=92t appear to do anything, can you remove it in a separate com=
mit.
>
> > +# note: "textrel" is not triggered on all archs
> > +INSANE_SKIP:${PN} =3D "textrel"
> > +# Build paths are currently embedded
> > +INSANE_SKIP:${PN} +=3D "buildpaths"
>
> Can you experiment and remove these to see if they=92re still valid?
>
> Ross
>

Looks like I missed this and pulled it in without being commented on.
Emekcan, can you address this in a follow-on patch?

Thanks,
Jon

Yeah sure, I had the patch, just need to rebase it

Thanks
Emek


--_000_DBBPR08MB4838A51C624195B5FCEDD03A8EFC9DBBPR08MB4838eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Jon Mason &lt;jdmas=
on@kudzu.us&gt;<br>
<b>Sent:</b> Tuesday, January 10, 2023 4:37 PM<br>
<b>To:</b> Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc:</b> Emekcan Aras &lt;Emekcan.Aras@arm.com&gt;; meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [PATCH 2/5] arm/optee: support optee 3.19</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On Thu, Jan 05, 2023 at 03:30:14PM =
+0000, Ross Burton wrote:<br>
&gt; &gt; +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc<br>
&gt; &gt; @@ -0,0 +1,82 @@<br>
&gt; &gt; +SUMMARY =3D &quot;OP-TEE Trusted OS&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;Open Portable Trusted Execution Environmen=
t - Trusted side of the TEE&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/" data-auth=
=3D"NotApplicable">https://www.op-tee.org/</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;[file://LICENSE;md5=3Dc1f21c4f72f372e=
f38a5a4aee55ec173]file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec173&quo=
t;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit deploy python3native<br>
&gt; &gt; +require optee.inc<br>
&gt; <br>
&gt; =85<br>
&gt; <br>
&gt; This file is 99% identical to optee-os.inc apart from FILEEXTRAPATHS, =
so put that assignment in the .bb and include the common optee-os.inc.<br>
&gt; <br>
&gt; Whilst I=92m there=85<br>
&gt; <br>
&gt; &gt; +do_compile:prepend() {<br>
&gt; &gt; + PLAT_LIBGCC_PATH=3D$(${CC} -print-libgcc-file-name)<br>
&gt; &gt; +}<br>
&gt; <br>
&gt; This doesn=92t appear to do anything, can you remove it in a separate =
commit.<br>
&gt; <br>
&gt; &gt; +# note: &quot;textrel&quot; is not triggered on all archs<br>
&gt; &gt; +INSANE_SKIP:${PN} =3D &quot;textrel&quot;<br>
&gt; &gt; +# Build paths are currently embedded<br>
&gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br>
&gt; <br>
&gt; Can you experiment and remove these to see if they=92re still valid?<b=
r>
&gt; <br>
&gt; Ross<br>
&gt; <br>
<br>
Looks like I missed this and pulled it in without being commented on.<br>
Emekcan, can you address this in a follow-on patch?<br>
<br>
Thanks,<br>
Jon</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Yeah sure, I had the patch, just ne=
ed to rebase it</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Thanks</div>
<div class=3D"PlainText elementToProof">Emek</div>
<div class=3D"PlainText elementToProof"><br>
</div>
</span></font></div>
</body>
</html>

--_000_DBBPR08MB4838A51C624195B5FCEDD03A8EFC9DBBPR08MB4838eurp_--


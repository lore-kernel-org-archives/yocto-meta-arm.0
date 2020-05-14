Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.78])
 by mx.groups.io with SMTP id smtpd.web12.8883.1589448461629135834
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 02:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=frqLDB41;
 spf=pass (domain: arm.com, ip: 40.107.4.78, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FffNmKwinaHUXj/JB35R/o0RXPmYN2itA55lDHJ4G+c=;
 b=frqLDB41UlsDJ3G+Qvsk7fWBYpKyayXmJVUN0+vjeV09wuJQr6EJYXCludRk3+FBhjVSYa6ffRYBHepQdN6mYty2/y8RH8JafP6FhYlDO27OtAg7JpvojNm5jv9W+lfKYRPzmW9Rh5x5iCGok0f+Ie1b6HKd7g2w0fTBaIWidRA=
Received: from DB6P18901CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::12)
 by VI1PR08MB3022.eurprd08.prod.outlook.com (2603:10a6:803:41::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 09:27:37 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::bc) by DB6P18901CA0002.outlook.office365.com
 (2603:10a6:4:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 09:27:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 09:27:37 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 14 May 2020 09:27:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f0b9afd3f973e5c
X-CR-MTA-TID: 64aa7808
Received: from acb5e1d6d0da.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0E32FCE5-540C-4EE1-B1E0-6F9ED501236A.1;
	Thu, 14 May 2020 09:27:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acb5e1d6d0da.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 09:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSXDLRWqY1PcaLCZMa0kENu7KYCyumGPls1XWID8pVfv36ayn4Nj10nJfDHAjlfdaiVDC1BGgCNJguqNaUzwf15eCstkrrxSTR5N8oSF1DV3jieW+EnZGaUESlRKTlRNG4a233kOxMoKb3JtcH6dCMVMNnjvdbV9zvTfnP9uV3uTNrkc34tirRb/HwrPBhzQhYSb2vKiAX6gkaFTO3ZVKd000NnP/2mD9361UJTOUWKrRNFnNHWVfdn33aYe3bnZwhlbSghG1m9tuoAvKq7w/I73/4tM/JSVD0JWQxD4F1GHArtqTq9LPE9RUtgeQCTlHNJMHULaVtAUcbJmvIuQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FffNmKwinaHUXj/JB35R/o0RXPmYN2itA55lDHJ4G+c=;
 b=BqurkA8hSGXtMDde7cabar7OJxJ11gArkfWt/ZqamxpW/Sqo9ty5XfdA8yS5JfEOc6QTuIsoJS5a+oO7rTdRroBUqHpeZdo6Maz0iSqhBcjZiNmvNvsdKOuqGeCgjBibcwayXwFuqpvkJC7wGqkC6vG0HOmuhKyEj+BVOsGJIes/ubZvLSFzl23+lxc6nXIVs+lCB1SNruJ3uBJOFn/b32Gu/D+XJluJ0WiFqrucTY9sY5bn+l0J/ucMlX+uvAUQVqvEticf9OgcvxFPsxHYe7ZlL3QNoXVfpVJ8y+iXEry54bGGNkRJtjCpL4P/tZE83J6DIDSEBEL+sTP/mGjU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FffNmKwinaHUXj/JB35R/o0RXPmYN2itA55lDHJ4G+c=;
 b=frqLDB41UlsDJ3G+Qvsk7fWBYpKyayXmJVUN0+vjeV09wuJQr6EJYXCludRk3+FBhjVSYa6ffRYBHepQdN6mYty2/y8RH8JafP6FhYlDO27OtAg7JpvojNm5jv9W+lfKYRPzmW9Rh5x5iCGok0f+Ie1b6HKd7g2w0fTBaIWidRA=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB3963.eurprd08.prod.outlook.com (2603:10a6:10:a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Thu, 14 May
 2020 09:27:29 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 09:27:29 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: "jdmason@kudzu.us" <jdmason@kudzu.us>, Joshua Watt <JPEWhacker@gmail.com>,
	Denys Dmytriyenko <denys@ti.com>, Diego Sueiro <Diego.Sueiro@arm.com>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] GNU Arm Embedded Toolchain recipe
Thread-Topic: [meta-arm] GNU Arm Embedded Toolchain recipe
Thread-Index: AQHWKZkBtIPRNNFWgUSUo917KIwGfqinN3U7gAACuACAABNO/A==
Date: Thu, 14 May 2020 09:27:29 +0000
Message-ID: 
 <DB8PR08MB4969CDBAA84AB250BCC0132DFABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200514023959.GA10245@kudzu.us>
 <DB8PR08MB49699F24FE7F77E2278D48A5FABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>,<92548AD2-51D6-42DF-ADF8-8FCD7611C009@arm.com>
In-Reply-To: <92548AD2-51D6-42DF-ADF8-8FCD7611C009@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78414884-eec1-4dd6-174c-08d7f7e90a80
x-ms-traffictypediagnostic: DB8PR08MB3963:|DB8PR08MB3963:|VI1PR08MB3022:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3022D681029F70B9758BE2DBFABC0@VI1PR08MB3022.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YGyidQ9iyQo9bJm02DDh2dIfU1DWcNsYMwOZdWrfSOJkrB2ec04uxePAH34RiXSzXZe+GPYLXQoo2soW7O70TMFDDtBFCaMa9QgPMWKGO5RJyKWwMGByyDBBSmITwncUxI8YKHsERQ7hY5YYMcwnnJqpPQFCF33HzvjC2wdEZ9+xKb9ICM1eKBxGgbH6XNvq9Iapu/Kl45RXvJsize8sImkTvwJuKYMt7e6DewC68i3eJivPYepW6XUqAcDeifwzL++5Uv2ygdNBdfB0CwZWZTbzSpDT/5sRWYR4BuabKB+xDwSEyf3KKxXUYgd8Xcfbtru5tMu5Slq8CL1bxnFqEx/9JI0qCBme3CyS5vAiSnsG+vooOZyd8gwo1S2fvBCYkrT0Y8ywI2kw7sCNt1B+kyLidx4rsu3iUs5IObyolK0+FRqVmXzjPHKS/ZHC7p9NfFz1eaHKy+FOLneyej1f06GQxesI32q8XQU8hRIlMMEwTv9C8F+VB2NIYnDOnlj7w8s3muuNZBehA+/Bs9UNqw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(76116006)(66946007)(8936002)(9686003)(55016002)(8676002)(316002)(5660300002)(54906003)(53546011)(52536014)(6506007)(966005)(110136005)(186003)(4326008)(478600001)(7696005)(166002)(26005)(2906002)(86362001)(33656002)(71200400001)(66446008)(19627405001)(64756008)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 vMqKAVgDtUOYZFrYw6LcO75/tNg7S6hx9ba9LmFPSO4Wxpgyj1xvDRJCYUKtxLeoUcopxKdGCJCYXUdjbW9GJSA4kYv0ejNNLpiI0iZ+QAj4CYjYNpRaAlwaXffyJXTnguzE62iTa4YHsZUlw8+E/YYljNeEItT9yristW39t0VPJCosR8yx0drXNUfiSDPBGifVNg1nu8G6dljTMLDdQphIxBbfsHNMh1Vl0FlxPou4GLWRBmzNtwalwjkkmrZ6ITPMQJxMaQhWsmJ/M7cJu+p2MpP8YN2ULG0l5+K5ZfFGdDwMp0k4IGn2qK3T/OyRnffj+JhXwmnPUTgEXx8rs0cQcvG4ogbOLonXqs0xPKD/9YaCbYmH7pXRUdv0CYLjPlnJruw8Ddo08oIuN8YK2pIDZe0Jlt5IvyIdMqt5dPXj5FEe94vBLok4a9NjEndGVMmmL3jvBQZi9nvfaGbd3nZ34YGuBlDDhlSMmD4V6DpuUVya/qtzAPsN5pevPa+r
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3963
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(5660300002)(26005)(6506007)(47076004)(70586007)(82740400003)(81166007)(4326008)(186003)(52536014)(8936002)(7696005)(356005)(53546011)(8676002)(33656002)(55016002)(336012)(478600001)(316002)(54906003)(19627405001)(86362001)(2906002)(9686003)(166002)(82310400002)(110136005)(70206006)(966005)(579004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b3e8c9be-5931-483c-1232-08d7f7e905b7
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ieyG3XocyMESMpB2pkvcBvBzvpWFEw9InRtj1Z4eZ2hAMxJVoF/Ez6mpYYkBIs96CvXBz9hJ6b1mdY9iaFdgGk3xgLnRtjjWeUI68keRv6rOFgGZ12zVYHupelVhzXbjtYi375hbh9e0hZLOl96ZTmUFrkpukigeagBn/tEFhfXzEVYlunnlqP8NsR79tXc9wTVmPcb5Ce3/z5AXWCEHDSo0XW4WQDjudSti2J94liULjAurtdcnqiAEN9Jh9QtE45oewKiqDUukcKJIoZOpqkYXTCvj8zlMs5OxV+hBCDu90Er9XSyxo5b3fbgRTf3W9u1VSIK8DnYXY1f3ifj3cYGViHoElQj6orvCPefAgLZ9xFXaomv2atXD8rd5u5cJb08P8FqCcf8V3QonKAcBwzc/IY59km8tJ9fFAge0IVQrjgF09LqeNsTUXgzZ9QbVmmhDPpHmI3h/WLDeeEZxk+6tPVFL6kNZnl4kWF7k1J7JtMpppyXcB+3p4sBRgBZ4IodiwBTa6GAQQmojWcfM/8ljEyNCYOdF+emmvVCsvD4lNETx1zIDyameX2s14W8Q+3MA8ird8KUngI4eaLxIVQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 09:27:37.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78414884-eec1-4dd6-174c-08d7f7e90a80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3022
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR08MB4969CDBAA84AB250BCC0132DFABC0DB8PR08MB4969eurp_"

--_000_DB8PR08MB4969CDBAA84AB250BCC0132DFABC0DB8PR08MB4969eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

________________________________
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
Sent: Thursday, May 14, 2020 1:37 PM
To: Khasim Mohammed <Khasim.Mohammed@arm.com>; meta-arm@lists.yoctoproject=
.org <meta-arm@lists.yoctoproject.org>
Cc: jdmason@kudzu.us <jdmason@kudzu.us>; Joshua Watt <JPEWhacker@gmail.com=
>; Denys Dmytriyenko <denys@ti.com>; Diego Sueiro <Diego.Sueiro@arm.com>; n=
d <nd@arm.com>
Subject: Re: [meta-arm] GNU Arm Embedded Toolchain recipe

Hi,

On 14 May 2020, at 09:04, Khasim Mohammed via lists.yoctoproject.org<http:=
//lists.yoctoproject.org> <khasim.mohammed=3Darm.com@lists.yoctoproject.org=
<mailto:khasim.mohammed=3Darm.com@lists.yoctoproject.org>> wrote:

Hi Jon,

---
From: meta-arm@lists.yoctoproject.org<mailto:meta-arm@lists.yoctoproject.o=
rg> <meta-arm@lists.yoctoproject.org<mailto:meta-arm@lists.yoctoproject.org=
>> on behalf of Jon Mason via lists.yoctoproject.org<http://lists.yoctoproj=
ect.org/> <jdmason=3Dkudzu.us@lists.yoctoproject.org<mailto:jdmason=3Dkudzu=
.us@lists.yoctoproject.org>>

Sent: Thursday, May 14, 2020 8:10 AM

To: meta-arm@lists.yoctoproject.org<mailto:meta-arm@lists.yoctoproject.org=
> <meta-arm@lists.yoctoproject.org<mailto:meta-arm@lists.yoctoproject.org>>

Cc: Joshua Watt <JPEWhacker@gmail.com<mailto:JPEWhacker@gmail.com>>; Denys=
 Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>; Diego Sueiro <Diego.Sueir=
o@arm.com<mailto:Diego.Sueiro@arm.com>>

Subject: [meta-arm] GNU Arm Embedded Toolchain recipe




There are a number of recipes floating around inside and outside of

Arm to support the GNU Arm Embedded Toolchain.  Specifically,

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtool=
s/gcc-arm-none-eabi-native_4.9.2015q3.bb

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtool=
s/gcc-arm-none-eabi_7-2018-q2-update.bb

https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tree/recipes-devt=
ools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-major.bb

After looking at the website

(https://developer.arm.com/tools-and-software/open-source-software/develop=
er-tools/gnu-toolchain/gnu-rm/downloads),

the latest version is 9-2019-q4-major.  Given this, I think the best

approach is to simply import the recipe from meta-rockchip into

meta-arm-toolchains and use that is the starting point.

Few software components are validated for a particular version of GCC thou=
gh ideally it should work for latest but we won't get support from the resp=
ective teams if we switch to a different toolchain. So we need a mechanism =
to pull different versions of toolchains.

Having said that, I think it is better we start improvising meta-arm-toolc=
hain with all required recipes instead of importing from meta-rockchip. In =
future we prefer meta-rockchip imports meta-arm-toolchain recipes.

Assuming everyone is fine with this, are their any other legacy

versions that are needed by other layers?

As mentioned above SCP 2.6 needs a particular version : https://developer.=
arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2=
-update-linux.tar.bz2

> Is this a recommendation or is there a major incompatibility with an oth=
er version ?
Actually on their portal they show 2019-q4 as supported version.

> Did you try with the latest version ?
Not yet,

> It might well be that they tested with only one version and that=92s why=
 they recommend it but we cannot afford to have one particular compiler per=
 package.
I agree, I was only concerned about the validation, if we use the tested t=
oolchain then I don't have to do thorough validation if I use different too=
lchain then validation will be on me :(

Let me give this a try

Bertrand

Regards,
Khasim


Thanks,
Jon

Regards,
Khasim
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.


IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.

--_000_DB8PR08MB4969CDBAA84AB250BCC0132DFABC0DB8PR08MB4969eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-=
1252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Bertrand Marquis &=
lt;Bertrand.Marquis@arm.com&gt;<br>
<b>Sent:</b> Thursday, May 14, 2020 1:37 PM<br>
<b>To:</b> Khasim Mohammed &lt;Khasim.Mohammed@arm.com&gt;; meta-arm@lists=
.yoctoproject.org &lt;meta-arm@lists.yoctoproject.org&gt;<br>
<b>Cc:</b> jdmason@kudzu.us &lt;jdmason@kudzu.us&gt;; Joshua Watt &lt;JPEW=
hacker@gmail.com&gt;; Denys Dmytriyenko &lt;denys@ti.com&gt;; Diego Sueiro =
&lt;Diego.Sueiro@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] GNU Arm Embedded Toolchain recipe</font>
<div>&nbsp;</div>
</div>
<div class=3D"" style=3D"word-wrap:break-word; line-break:after-white-spac=
e">Hi,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 14 May 2020, at 09:04, Khasim Mohammed via <a href=3D"h=
ttp://lists.yoctoproject.org" class=3D"">
lists.yoctoproject.org</a> &lt;<a href=3D"mailto:khasim.mohammed=3Darm.com=
@lists.yoctoproject.org" class=3D"">khasim.mohammed=3Darm.com@lists.yoctopr=
oject.org</a>&gt; wrote:</div>
<br class=3D"x_Apple-interchange-newline">
<div class=3D""><span class=3D"" style=3D"font-family:Helvetica; font-size=
:12px; font-style:normal; font-variant-caps:normal; font-weight:normal; let=
ter-spacing:normal; text-align:start; text-indent:0px; text-transform:none;=
 white-space:normal; word-spacing:0px; text-decoration:none; float:none; di=
splay:inline!important">Hi
 Jon,</span><br class=3D"" style=3D"font-family:Helvetica; font-size:12px;=
 font-style:normal; font-variant-caps:normal; font-weight:normal; letter-sp=
acing:normal; text-align:start; text-indent:0px; text-transform:none; white=
-space:normal; word-spacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">---</span><br class=3D"" style=3D"font-family:Helvetica; font-size:=
12px; font-style:normal; font-variant-caps:normal; font-weight:normal; lett=
er-spacing:normal; text-align:start; text-indent:0px; text-transform:none; =
white-space:normal; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">From:<span class=3D"x_Apple-converted-space">&nbsp;</span></span><a=
 href=3D"mailto:meta-arm@lists.yoctoproject.org" class=3D"" style=3D"font-f=
amily:Helvetica; font-size:12px; font-style:normal; font-variant-caps:norma=
l; font-weight:normal; letter-spacing:normal; orphans:auto; text-align:star=
t; text-indent:0px; text-transform:none; white-space:normal; widows:auto; w=
ord-spacing:0px">meta-arm@lists.yoctoproject.org</a><span class=3D"" style=
=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-variant=
-caps:normal; font-weight:normal; letter-spacing:normal; text-align:start; =
text-indent:0px; text-transform:none; white-space:normal; word-spacing:0px;=
 text-decoration:none; float:none; display:inline!important"><span class=3D=
"x_Apple-converted-space">&nbsp;</span>&lt;</span><a href=3D"mailto:meta-ar=
m@lists.yoctoproject.org" class=3D"" style=3D"font-family:Helvetica; font-s=
ize:12px; font-style:normal; font-variant-caps:normal; font-weight:normal; =
letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; tex=
t-transform:none; white-space:normal; widows:auto; word-spacing:0px">meta-a=
rm@lists.yoctoproject.org</a><span class=3D"" style=3D"font-family:Helvetic=
a; font-size:12px; font-style:normal; font-variant-caps:normal; font-weight=
:normal; letter-spacing:normal; text-align:start; text-indent:0px; text-tra=
nsform:none; white-space:normal; word-spacing:0px; text-decoration:none; fl=
oat:none; display:inline!important">&gt;
 on behalf of Jon Mason via<span class=3D"x_Apple-converted-space">&nbsp;<=
/span></span><a href=3D"http://lists.yoctoproject.org/" class=3D"" style=3D=
"font-family:Helvetica; font-size:12px; font-style:normal; font-variant-cap=
s:normal; font-weight:normal; letter-spacing:normal; orphans:auto; text-ali=
gn:start; text-indent:0px; text-transform:none; white-space:normal; widows:=
auto; word-spacing:0px">lists.yoctoproject.org</a><span class=3D"" style=3D=
"font-family:Helvetica; font-size:12px; font-style:normal; font-variant-cap=
s:normal; font-weight:normal; letter-spacing:normal; text-align:start; text=
-indent:0px; text-transform:none; white-space:normal; word-spacing:0px; tex=
t-decoration:none; float:none; display:inline!important"><span class=3D"x_A=
pple-converted-space">&nbsp;</span>&lt;</span><a href=3D"mailto:jdmason=3Dk=
udzu.us@lists.yoctoproject.org" class=3D"" style=3D"font-family:Helvetica; =
font-size:12px; font-style:normal; font-variant-caps:normal; font-weight:no=
rmal; letter-spacing:normal; orphans:auto; text-align:start; text-indent:0p=
x; text-transform:none; white-space:normal; widows:auto; word-spacing:0px">=
jdmason=3Dkudzu.us@lists.yoctoproject.org</a><span class=3D"" style=3D"font=
-family:Helvetica; font-size:12px; font-style:normal; font-variant-caps:nor=
mal; font-weight:normal; letter-spacing:normal; text-align:start; text-inde=
nt:0px; text-transform:none; white-space:normal; word-spacing:0px; text-dec=
oration:none; float:none; display:inline!important">&gt;</span><br class=3D=
"" style=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-=
variant-caps:normal; font-weight:normal; letter-spacing:normal; text-align:=
start; text-indent:0px; text-transform:none; white-space:normal; word-spaci=
ng:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Sent:
 Thursday, May 14, 2020 8:10 AM</span><br class=3D"" style=3D"font-family:=
Helvetica; font-size:12px; font-style:normal; font-variant-caps:normal; fon=
t-weight:normal; letter-spacing:normal; text-align:start; text-indent:0px; =
text-transform:none; white-space:normal; word-spacing:0px; text-decoration:=
none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">To:<span class=3D"x_Apple-converted-space">&nbsp;</span></span><a h=
ref=3D"mailto:meta-arm@lists.yoctoproject.org" class=3D"" style=3D"font-fam=
ily:Helvetica; font-size:12px; font-style:normal; font-variant-caps:normal;=
 font-weight:normal; letter-spacing:normal; orphans:auto; text-align:start;=
 text-indent:0px; text-transform:none; white-space:normal; widows:auto; wor=
d-spacing:0px">meta-arm@lists.yoctoproject.org</a><span class=3D"" style=3D=
"font-family:Helvetica; font-size:12px; font-style:normal; font-variant-cap=
s:normal; font-weight:normal; letter-spacing:normal; text-align:start; text=
-indent:0px; text-transform:none; white-space:normal; word-spacing:0px; tex=
t-decoration:none; float:none; display:inline!important"><span class=3D"x_A=
pple-converted-space">&nbsp;</span>&lt;</span><a href=3D"mailto:meta-arm@li=
sts.yoctoproject.org" class=3D"" style=3D"font-family:Helvetica; font-size:=
12px; font-style:normal; font-variant-caps:normal; font-weight:normal; lett=
er-spacing:normal; orphans:auto; text-align:start; text-indent:0px; text-tr=
ansform:none; white-space:normal; widows:auto; word-spacing:0px">meta-arm@l=
ists.yoctoproject.org</a><span class=3D"" style=3D"font-family:Helvetica; f=
ont-size:12px; font-style:normal; font-variant-caps:normal; font-weight:nor=
mal; letter-spacing:normal; text-align:start; text-indent:0px; text-transfo=
rm:none; white-space:normal; word-spacing:0px; text-decoration:none; float:=
none; display:inline!important">&gt;</span><br class=3D"" style=3D"font-fam=
ily:Helvetica; font-size:12px; font-style:normal; font-variant-caps:normal;=
 font-weight:normal; letter-spacing:normal; text-align:start; text-indent:0=
px; text-transform:none; white-space:normal; word-spacing:0px; text-decorat=
ion:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Cc:
 Joshua Watt &lt;</span><a href=3D"mailto:JPEWhacker@gmail.com" class=3D""=
 style=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-va=
riant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:auto;=
 text-align:start; text-indent:0px; text-transform:none; white-space:normal=
; widows:auto; word-spacing:0px">JPEWhacker@gmail.com</a><span class=3D"" s=
tyle=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-vari=
ant-caps:normal; font-weight:normal; letter-spacing:normal; text-align:star=
t; text-indent:0px; text-transform:none; white-space:normal; word-spacing:0=
px; text-decoration:none; float:none; display:inline!important">&gt;;
 Denys Dmytriyenko &lt;</span><a href=3D"mailto:denys@ti.com" class=3D"" s=
tyle=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-vari=
ant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:auto; t=
ext-align:start; text-indent:0px; text-transform:none; white-space:normal; =
widows:auto; word-spacing:0px">denys@ti.com</a><span class=3D"" style=3D"fo=
nt-family:Helvetica; font-size:12px; font-style:normal; font-variant-caps:n=
ormal; font-weight:normal; letter-spacing:normal; text-align:start; text-in=
dent:0px; text-transform:none; white-space:normal; word-spacing:0px; text-d=
ecoration:none; float:none; display:inline!important">&gt;;
 Diego Sueiro &lt;</span><a href=3D"mailto:Diego.Sueiro@arm.com" class=3D"=
" style=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-v=
ariant-caps:normal; font-weight:normal; letter-spacing:normal; orphans:auto=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; widows:auto; word-spacing:0px">Diego.Sueiro@arm.com</a><span class=3D"" =
style=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-var=
iant-caps:normal; font-weight:normal; letter-spacing:normal; text-align:sta=
rt; text-indent:0px; text-transform:none; white-space:normal; word-spacing:=
0px; text-decoration:none; float:none; display:inline!important">&gt;</span=
><br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Subject:
 [meta-arm] GNU Arm Embedded Toolchain recipe</span><br class=3D"" style=
=3D"font-family:Helvetica; font-size:12px; font-style:normal; font-variant=
-caps:normal; font-weight:normal; letter-spacing:normal; text-align:start; =
text-indent:0px; text-transform:none; white-space:normal; word-spacing:0px;=
 text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
There are a number of recipes floating around inside and outside of<br cla=
ss=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
Arm to support the GNU Arm Embedded Toolchain. &nbsp;Specifically,<br clas=
s=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes=
-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb" class=3D"">https://git=
.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/gcc-arm-no=
ne-eabi-native_4.9.2015q3.bb</a><br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes=
-ti/devtools/gcc-arm-none-eabi_7-2018-q2-update.bb" class=3D"">https://git.=
yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/gcc-arm-non=
e-eabi_7-2018-q2-update.bb</a><br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tree/r=
ecipes-devtools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-major.=
bb" class=3D"">https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tre=
e/recipes-devtools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-maj=
or.bb</a><br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
After looking at the website<br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
(<a href=3D"https://developer.arm.com/tools-and-software/open-source-softw=
are/developer-tools/gnu-toolchain/gnu-rm/downloads" class=3D"">https://deve=
loper.arm.com/tools-and-software/open-source-software/developer-tools/gnu-t=
oolchain/gnu-rm/downloads</a>),<br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
the latest version is 9-2019-q4-major. &nbsp;Given this, I think the best<=
br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
approach is to simply import the recipe from meta-rockchip into<br class=
=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
meta-arm-toolchains and use that is the starting point.<br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Few
 software components are validated for a particular version of GCC though =
ideally it should work for latest but we won't get support from the respect=
ive teams if we switch to a different toolchain. So we need a mechanism to =
pull different versions of toolchains.</span><br class=3D"" style=3D"font-f=
amily:Helvetica; font-size:12px; font-style:normal; font-variant-caps:norma=
l; font-weight:normal; letter-spacing:normal; text-align:start; text-indent=
:0px; text-transform:none; white-space:normal; word-spacing:0px; text-decor=
ation:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Having
 said that, I think it is better we start improvising meta-arm-toolchain w=
ith all required recipes instead of importing from meta-rockchip. In future=
 we prefer meta-rockchip imports meta-arm-toolchain recipes.</span><br clas=
s=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:normal; f=
ont-variant-caps:normal; font-weight:normal; letter-spacing:normal; text-al=
ign:start; text-indent:0px; text-transform:none; white-space:normal; word-s=
pacing:0px; text-decoration:none">
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
Assuming everyone is fine with this, are their any other legacy<br class=
=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
versions that are needed by other layers?<br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">As
 mentioned above SCP 2.6 needs a particular version :<span class=3D"x_Appl=
e-converted-space">&nbsp;</span></span><a href=3D"https://developer.arm.com=
/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update=
-linux.tar.bz2" class=3D"" style=3D"font-family:Helvetica; font-size:12px; =
font-style:normal; font-variant-caps:normal; font-weight:normal; letter-spa=
cing:normal; orphans:auto; text-align:start; text-indent:0px; text-transfor=
m:none; white-space:normal; widows:auto; word-spacing:0px">https://develope=
r.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-=
q2-update-linux.tar.bz2</a><br class=3D"" style=3D"font-family:Helvetica; f=
ont-size:12px; font-style:normal; font-variant-caps:normal; font-weight:nor=
mal; letter-spacing:normal; text-align:start; text-indent:0px; text-transfo=
rm:none; white-space:normal; word-spacing:0px; text-decoration:none">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>&gt; Is this a recommendation or is there a major incompatibility wit=
h an other version ?</div>
<div>Actually on their portal they show 2019-q4 as supported version.</div=
>
<div><br class=3D"">
</div>
<div>&gt; Did you try with the latest version ?</div>
<div>Not yet, <br>
</div>
<div><br class=3D"">
</div>
<div>&gt; It might well be that they tested with only one version and that=
=
=92s why they recommend it but we cannot afford to have one particular com=
piler per package.</div>
<div>I agree, I was only concerned about the validation, if we use the tes=
ted toolchain then I don't have to do thorough validation if I use differen=
t toolchain then validation will be on me :(
<br>
</div>
<div><br>
</div>
<div>Let me give this a try<br>
</div>
<div><br class=3D"">
</div>
<div>Bertrand</div>
</div>
<div><br>
</div>
<div>Regards,</div>
<div>Khasim<br>
</div>
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><br class=3D"" style=3D"font-family:Helvetica; font-size:1=
2px; font-style:normal; font-variant-caps:normal; font-weight:normal; lette=
r-spacing:normal; text-align:start; text-indent:0px; text-transform:none; w=
hite-space:normal; word-spacing:0px; text-decoration:none">
<blockquote type=3D"cite" class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; orphans:auto; text-align:start; text-indent:0px; te=
xt-transform:none; white-space:normal; widows:auto; word-spacing:0px; text-=
decoration:none">
Thanks,<br class=3D"">
Jon<br class=3D"">
</blockquote>
<br class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:=
normal; font-variant-caps:normal; font-weight:normal; letter-spacing:normal=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Regards,</span><br class=3D"" style=3D"font-family:Helvetica; font-=
size:12px; font-style:normal; font-variant-caps:normal; font-weight:normal;=
 letter-spacing:normal; text-align:start; text-indent:0px; text-transform:n=
one; white-space:normal; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">Khasim</span><br class=3D"" style=3D"font-family:Helvetica; font-si=
ze:12px; font-style:normal; font-variant-caps:normal; font-weight:normal; l=
etter-spacing:normal; text-align:start; text-indent:0px; text-transform:non=
e; white-space:normal; word-spacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant">IMPORTANT
 NOTICE: The contents of this email and any attachments are confidential a=
nd may also be privileged. If you are not the intended recipient, please no=
tify the sender immediately and do not disclose the contents to any other p=
erson, use it for any purpose, or
 store or copy the information in any medium. Thank you.</span><br class=
=3D"" style=3D"font-family:Helvetica; font-size:12px; font-style:normal; f=
ont-variant-caps:normal; font-weight:normal; letter-spacing:normal; text-al=
ign:start; text-indent:0px; text-transform:none; white-space:normal; word-s=
pacing:0px; text-decoration:none">
<span class=3D"" style=3D"font-family:Helvetica; font-size:12px; font-styl=
e:normal; font-variant-caps:normal; font-weight:normal; letter-spacing:norm=
al; text-align:start; text-indent:0px; text-transform:none; white-space:nor=
mal; word-spacing:0px; text-decoration:none; float:none; display:inline!imp=
ortant"></span></div>
</blockquote>
</div>
<br class=3D"">
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB8PR08MB4969CDBAA84AB250BCC0132DFABC0DB8PR08MB4969eurp_--

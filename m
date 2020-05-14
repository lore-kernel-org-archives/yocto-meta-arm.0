Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.62])
 by mx.groups.io with SMTP id smtpd.web10.8192.1589443457647252939
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 01:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nEU6uBa0;
 spf=pass (domain: arm.com, ip: 40.107.5.62, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeW/p3DwzbcpT4b02bJbVNQW/+9kW+xECxPmJPMItS0=;
 b=nEU6uBa0/tMWb+yC4jcLKffUVa2beRvB8HaIVOXYqVRQV3AZkbyDqB62xexKRd2GM3yzrCZNeGO/JB25iHlD/RHFhLLyHyMFUAP5WyeK9ug17qBzIrin5YC2jLZV0+uI5+wShIRKSL8gJe0PGs3X1OX8kOTFF2x84N5RtugQ4GQ=
Received: from AM6P194CA0092.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::33)
 by DB7PR08MB3628.eurprd08.prod.outlook.com (2603:10a6:10:44::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Thu, 14 May
 2020 08:04:11 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f::4) by AM6P194CA0092.outlook.office365.com
 (2603:10a6:209:8f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 08:04:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 08:04:11 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 14 May 2020 08:04:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 915d8e7af63a80f9
X-CR-MTA-TID: 64aa7808
Received: from e0dc0162fb76.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B6204653-CA20-4363-85A5-6E0DC15DD003.1;
	Thu, 14 May 2020 08:04:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0dc0162fb76.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 08:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn+hnCS38AA8ou7xloKVIgGnKbBQ3tLj4JepWggNqoDy7ciK9XxrZ2hdlEJNphw8U8EztrkZq5mff7tviJneiYTW/Jc69R01nxp8uesPIZtwCyJ3Vx8vD/B68uPGDCsP7zENuMNwF3P3Y0r9//ygHFfXXIahO7/wb95EwobGfM9oGB/r1MHLBrzg56TBdXDMU0VCJItOJQgLV/o+4ykuFEOvhZ+pPPHjDLkaksIQrvm6hUafrAbZ0yg37j3T6VuXqOQaQoDyhuEx9qlS79Qu3bYBsmUReiwpLwVo356Z2w0jrCkIwADfNLYfTTPQ6HxC01Yn3rgsomMSxp0LE0EXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeW/p3DwzbcpT4b02bJbVNQW/+9kW+xECxPmJPMItS0=;
 b=GGZTJC9xq8Mg80efELGQCXTvO2yWzV8JCrvZiPPeNv67sTEtIZiwCLfByI98ArBYEc6nsVwH8ywAFkcBFiGiqCm6cVptdxH7s7zDfb1GsePz1skYDZ5f5jiuCh0a/VcyotiPhQ6q7TkbretL5TiU6XSZgjGfjJF+JAwcPtUkKilAql5WqNifOjrfl/JKSaVMlya/G1dfZySGdCYshHAhLvu2608bI3OIlSz+ziVLVTxaPkrDqWimiVpEJxTQ3EQV3xXQjoiv/c0hLWe7NTNdm5hvWFEXuxAAl1/LkaG5tBU9PGERd+OvZUcncafdxVqK8ty+VVgGA+4gicAGRC2JIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeW/p3DwzbcpT4b02bJbVNQW/+9kW+xECxPmJPMItS0=;
 b=nEU6uBa0/tMWb+yC4jcLKffUVa2beRvB8HaIVOXYqVRQV3AZkbyDqB62xexKRd2GM3yzrCZNeGO/JB25iHlD/RHFhLLyHyMFUAP5WyeK9ug17qBzIrin5YC2jLZV0+uI5+wShIRKSL8gJe0PGs3X1OX8kOTFF2x84N5RtugQ4GQ=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4169.eurprd08.prod.outlook.com (2603:10a6:10:ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 08:04:04 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 08:04:04 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
CC: Joshua Watt <JPEWhacker@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] GNU Arm Embedded Toolchain recipe
Thread-Topic: [meta-arm] GNU Arm Embedded Toolchain recipe
Thread-Index: AQHWKZkBtIPRNNFWgUSUo917KIwGfqinN3U7
Date: Thu, 14 May 2020 08:04:03 +0000
Message-ID: 
 <DB8PR08MB49699F24FE7F77E2278D48A5FABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200514023959.GA10245@kudzu.us>
In-Reply-To: <20200514023959.GA10245@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60ee9c11-3b5f-42a8-464e-08d7f7dd62ad
x-ms-traffictypediagnostic: DB8PR08MB4169:|DB8PR08MB4169:|DB7PR08MB3628:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB36283744DCAF23D47FA03C4BFABC0@DB7PR08MB3628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QpMDU1gwdH0UQs81pcSmMtKQUcZETAZMH2Zru/MwtJDHek34lBwlbYs3j98Bjb0BAjcyUkk2P7BD3D2/bOjhecCFnZQLzEwZo2Vbni0ItteVQMWCfiSVsqOw9VJ9wK0nMDJ59iF/RlH5vPir+a0tpDIblCz3cmDhH0hcadViPifNeXrdx6rIr/8F/VxwqFxJMr43j4mtSK1fk9mvCgbhP3zBAQ/34nJGDOIKV/T3+MOwP1buphsYFHqA0xVju3FtxMMnKPGoEbyHaQ2pvgQtlBpQ/TM+VhLv/GECg9E1dgOTycfEwOe8QUUf8tKwajtz6h6858xV9bcMQA1SIZ3AjNfRzi3/02sgektBa1kWEzzKjJoAcTiyaF8uLz+nGvDGmRXfePA8lXHIB2RpbWdhXdQkcrVkfWtbzIcXqgHgXtz9r9EQJXyXNQj//sxOjD0mS82fqsucie6T/RNDATYWg54+WwjQmmh5FAGFWAvYtPiq5VJjCKLS7FLVmQvC5j0IcBm/saXL28gnw+XHI0i7cA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(33656002)(4326008)(71200400001)(52536014)(316002)(86362001)(53546011)(55016002)(2906002)(186003)(9686003)(6506007)(26005)(66556008)(76116006)(66476007)(66946007)(54906003)(7696005)(5660300002)(8936002)(66446008)(110136005)(966005)(478600001)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 9/6+XGEf4fYzE1CF7IvPmEJOKI50Pho0B3F9Fmhr3qtFPeCSD4OtDhJ6UhqzXZJHMCHeIvCOF8Bf4UzwYsIsh/TlzXbMxzL11IapaItXyJ9ps2qtlhMSVqL7Dm+PkJPVXiFdeBMwRwY2Jocp61DmfCtHoLJFvvEyJ6F2Nk5W/GeJtZT/uChvh103q2XN1+rRnXOU6CYDsMO3p9mAENOpIuoBy/lIOhCr81QVIuPHnLvNYF3bYEo9CtYNAYsxtK9Qwsh/PlOnhG+XfCdjoIhcW3U62mGwqalPkftGpPWBi/rpQclSR3zf6KhbUWae+0zkkM33LAf05MHzeo4Q+u21MZ9thmseyLNl1T0nvG2tJrGsXyfOV9HjqNPOUi6omCiX+Xjq6d/t0EQD9WZS2ouywMrVYr/eE9ZieUPOc8/TzwYMkl26sap0U1cImR9LiAaXk1VfSOQgDYe8/Y62nsB4j/RLZdVcjwskA5JIQu8Bid9TjiNqFqi8fNjUAZBdwhqH
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4169
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(86362001)(33656002)(9686003)(6506007)(26005)(8676002)(81166007)(356005)(55016002)(2906002)(7696005)(8936002)(82310400002)(186003)(5660300002)(36906005)(110136005)(47076004)(70206006)(70586007)(54906003)(966005)(4326008)(52536014)(336012)(478600001)(82740400003)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0593d254-10ab-4f93-40b8-08d7f7dd5e78
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0bTnXSFEZXPCGuzN/vQ3NDjeUnmsPYye3WIbx1M4iVSjVUE40fEhCjqd0S/Q5hMh0uj265FkPt51ZULCmBKUNgTDvgu6pbpZNgsngFF78iXwxVtK+ovz3s27+tieKlF8Pfyd1rgMTXUV/3FlmJ8643BYNraMfl1b0kN2Q2NUepmWcdlNkD50tlz16CunoeTnpE5IVTKD9DwktvrwazQ1MTbynsWKqfANUwNRE0IqFOm+J9rQO995quy9O0CwaL31BWI5JrPXdFSqcMQ/SlMbUnIJbGs2uoT0E17In7R5YBDYRiNafQ8fgcoiZnWD5L3L9TX9Qxd+ualRe/QYbeu9uZw4lYea79mBNl+NgwMGdw7FVlcgBwV8GjX+AzVRXzJIV7xQtsbsxEy4RXWE4MAamsa5zAUZRk9sxxN1mulz0EviFHmOfpbSvdFd8gHPLkKu6JHQ3//T2tApQgn9T99UsZTKsxLlnROd4QI2qVZ1n3Ruifj6g0jRAiiyFI1Xd/b7c1BJ1IdwuH6iUGm+Vsm16vMJaoT8ETj7icDoN7e/AR9ReZmbd6gbCXuAZQCeVXW4S8QJyMiGb7uKhPf7SP28CxnQn32nGpjs+T0GcK8BQEE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 08:04:11.0541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ee9c11-3b5f-42a8-464e-08d7f7dd62ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3628
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

---
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.yo=
ctoproject.org>

Sent: Thursday, May 14, 2020 8:10 AM

To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>

Cc: Joshua Watt <JPEWhacker@gmail.com>; Denys Dmytriyenko <denys@ti.com>; D=
iego Sueiro <Diego.Sueiro@arm.com>

Subject: [meta-arm] GNU Arm Embedded Toolchain recipe




> There are a number of recipes floating around inside and outside of

> Arm to support the GNU Arm Embedded Toolchain.  Specifically,

> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtoo=
ls/gcc-arm-none-eabi-native_4.9.2015q3.bb

> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtoo=
ls/gcc-arm-none-eabi_7-2018-q2-update.bb

> https://git.yoctoproject.org/cgit/cgit.cgi/meta-rockchip/tree/recipes-dev=
tools/gcc-arm-none-eabi/gcc-arm-none-eabi-native_9-2019-q4-major.bb

> After looking at the website

> (https://developer.arm.com/tools-and-software/open-source-software/develo=
per-tools/gnu-toolchain/gnu-rm/downloads),

> the latest version is 9-2019-q4-major.  Given this, I think the best

> approach is to simply import the recipe from meta-rockchip into

> meta-arm-toolchains and use that is the starting point.

Few software components are validated for a particular version of GCC thoug=
h ideally it should work for latest but we won't get support from the respe=
ctive teams if we switch to a different toolchain. So we need a mechanism t=
o pull different versions of toolchains.

Having said that, I think it is better we start improvising meta-arm-toolch=
ain with all required recipes instead of importing from meta-rockchip. In f=
uture we prefer meta-rockchip imports meta-arm-toolchain recipes.

> Assuming everyone is fine with this, are their any other legacy

> versions that are needed by other layers?

As mentioned above SCP 2.6 needs a particular version : https://developer.a=
rm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-=
update-linux.tar.bz2

> Thanks,
> Jon

Regards,
Khasim
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

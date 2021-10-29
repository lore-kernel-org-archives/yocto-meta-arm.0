Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322B4C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 08:20:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web11.2681.1635495613468886600
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 01:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=3UGKhhNN;
 spf=pass (domain: arm.com, ip: 40.107.20.79, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l2K4g3qQIihAB98DCdU2Ga8+dtJL63SNhCI36ZjjDM=;
 b=3UGKhhNNA04oh0h5iYdCpfLGGPYbgp9lGn90Zt/c7drSh6G34Fq6JaOtCF9xYZM8PYe1Slj/OGBj7txXPP8k+a91V0sq9Id0UjKc9WfhWTCDSIaDOtkQiyk5cTFdHfR1lZRbOqL1cJIJD+s3LgO4Eqr4r3IQoZhHQGTPIiobsZ4=
Received: from AM7PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:100::18)
 by PAXPR08MB6431.eurprd08.prod.outlook.com (2603:10a6:102:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 08:20:10 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::21) by AM7PR02CA0008.outlook.office365.com
 (2603:10a6:20b:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 29 Oct 2021 08:20:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 08:20:10 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Fri, 29 Oct 2021 08:20:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: da8c65f622ccae4a
X-CR-MTA-TID: 64aa7808
Received: from 562da870633d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CB74CF2-0011-439D-A652-29C143C724D5.1;
	Fri, 29 Oct 2021 08:20:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 562da870633d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Oct 2021 08:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvKC9jx+xyTdsYwCDiyxzkCma2ScLNrU3x82iyj47aRiBaU4cnbM1eYsTPJ1xmYAIBUFOAZKEra9mgJ5sbLZVw4ctwx4W9sJJPpHZgQYfcfQk/s3wPixbL8fJi7Ftds0pRvusJPefmykVjAvCCK9ajdqffuEUkWvQd3lfDsnCb1aTWhUj+P6os+7CJUnQgjIGWD8Kfcg6V2Bg03aMoBNd7QgwV+FOnU4Qqp8UmtKCheBuP8qmhww8q5UZUKc3bcYHwvmdJq+APLhe8bW9Wh1fL8I35AiPatNBErLQoml+Ix8ciKXE/A4yRYB61PIs+xQIB3C/xyb86VkNWF79aaWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9l2K4g3qQIihAB98DCdU2Ga8+dtJL63SNhCI36ZjjDM=;
 b=WF+DRhbLDw5Kp8LF93o75xCBm6ZdiBnXUN2PCF0TLfZMtAHfBKK0muMXvgAmTThC1XcjUEl3/Ue1+ghDos91ukU4e1hROeb0Sxb6+rQitqXgKNvcNL7MvWPayUCH4H9BZE6tZsWtPWdAgzUup9wG8H4m6deUGgA6Xvj81ag59fGUn0fbb+r/JmqzSIz1gc4dtQ5sIr6ys04DhGhfSQmjno357AB6KK3/jg/vUzVAUzQv7pIuXq6LsJlvklXg1WKm7LgCaeavTH1jS10+2MfJYJKvyLWR34r6noHhp2uN53smeIAC1lI7AUU17n4ymkKnQu/kJmPtdrw7p3dMrhbU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l2K4g3qQIihAB98DCdU2Ga8+dtJL63SNhCI36ZjjDM=;
 b=3UGKhhNNA04oh0h5iYdCpfLGGPYbgp9lGn90Zt/c7drSh6G34Fq6JaOtCF9xYZM8PYe1Slj/OGBj7txXPP8k+a91V0sq9Id0UjKc9WfhWTCDSIaDOtkQiyk5cTFdHfR1lZRbOqL1cJIJD+s3LgO4Eqr4r3IQoZhHQGTPIiobsZ4=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4657.eurprd08.prod.outlook.com (2603:10a6:20b:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 08:19:59 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 08:19:58 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: meta-arm-autonomy layer deprecation schedule
Thread-Topic: meta-arm-autonomy layer deprecation schedule
Thread-Index: AQHXzJ212T+oIBkIDUmRxKh2OXdJew==
Date: Fri, 29 Oct 2021 08:19:58 +0000
Message-ID: 
 <AM6PR08MB34617A52B44CD1640FF9746E92879@AM6PR08MB3461.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 4ad31c8a-c870-5b93-0f56-03e672d968c1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 531aada7-0d9d-49bc-af75-08d99ab4ec97
x-ms-traffictypediagnostic: AM6PR08MB4657:|PAXPR08MB6431:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB643129382061CB42453A0E4092879@PAXPR08MB6431.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m2Jy80Rhe478LYdRXcoa2Umcj02roiOMNarO6O903ii3TcmXz85T2M/Ly9ViSv/vPd2W58jgXfJFQwvhU+JpTWiSZq4Y8nvx3mYqKJ+OP/bRJMBPJyUnq4o5BCnogbzQ53wGbstf7uf54QtBZJVDFrtF/nnN86EKB5IkNZPyrVASLQBKKtRQ54LipImkgN4xIHF6EUswtUbhzNDEJ3bb+SuvUxKR4pwUXtZNHbuDTWRdO1fa2utT8K3Q1OWyZpaEIb1dP0xdh8HyfzWz7IcoQpiTQHFnisTVCamMgcLmEDqqXD4E5E6vqFp7ZEu6uCDRX0QY+BS5DQrmUHfaSgdEymKgLk6aiLwLYcOYxOGrZFlHgq3wCx623L1PBe+olNskBNfe3BtphZDTSq3+QwZXfddpUJuGT/xQFwC/+iTxWLVUjmrPeOK6TDpfDwVZ3Yoxgk36DT7qa4h7pWSOFoY/9u2nrQKSzOWZBX+bYcysKzxOcifrrTGc0H7Hncq8kM3v8gQocoiDrYUW39i7Yrygi3CjX/phgiM73vmmwWmAAIMEI7GvDW/RKKUo8vRJFNo04ox2qwYMQ/c4yXgfWwgbKQWT9f71zjnqoi3w4BcLWWnC7fCv0hXm3PSGPZZ8sVbVTa2+ZlXG9oxOyidWJ4T1exyqMMhV8XiaiiTDE2RtfuNEUh/CzkHtwmolcNYZjm8ooYDpFGmsQ3A4g+d0YUH5Ug==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(76116006)(55016002)(66446008)(86362001)(66556008)(9686003)(66946007)(66476007)(4326008)(8676002)(5660300002)(19627405001)(6506007)(52536014)(33656002)(38070700005)(64756008)(26005)(6916009)(38100700002)(71200400001)(2906002)(316002)(122000001)(7696005)(186003)(8936002)(508600001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB34617A52B44CD1640FF9746E92879AM6PR08MB3461eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ce86a04-fc75-470f-02f3-08d99ab4e5ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n51nUC8ROsg5K/B4ilBz2LlTwUlW+j6+ATW0qgf7jXJ+w0req/WSUEB61zmAR0vMGTKRHns+6g/rDndThWnV1shZ4OO8wUPiIxY6sWweZkSKY4ncT73z/H3WpDfGLTkbr+tqQVzCUJvB2FTxLrYUmC5NmuDxrkUlLrmWY9ejk4FdJ6kTR4ZbAqYaP99odVxsVZUKGcZJVtJleUkoPPXEFuQT4a5fXQ0rLdMTHCagvzpXHBPNx7XwHPELFLkGXpGVlYihj8WPCC08vOyxgqFf+JCJOuuHXbzHF88+21hT+Uld0CKGIqYGbaz7zIZ8I8UVMDopQ2mz31C4Q2xujm8klOOP/Soz7k581Y7700AjM9pnccyg4UXbs4sBaNZ9q9wfcZuERjV7yOVQCzm7mvLmOgFE/R8ygJnTaloqRaqfs6fQd2GQnLGmzjFv9mSjeCVuPZtGrrKT3lZjbleJKxCdEp0dDQP47Ct7BP94TQdg/C6Z49fMKQcyyzBcHtR1Mfd2LNVIbc3UILR6YAuMngv/x7m6+1e+i6lJthZAcjeUnIwyPM2FMbqCW8DnXeC+bPQyhvBGbCdx80culLWKpu+TY2Cyu4YDsJ7yV69e8GvPPXDFAxh9f2w+G9J8rekKYR70ZKyglxkXh9N9xSZvcc9j2aR7N1utQwS8fnHjuvsZgGNxkVr158JxEbzcMTE5GKlYiOd3QECYTJb2j+HZlEcyiQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(9686003)(356005)(8676002)(55016002)(186003)(316002)(7696005)(4326008)(81166007)(52536014)(36860700001)(6916009)(2906002)(508600001)(33656002)(5660300002)(47076005)(86362001)(8936002)(336012)(70206006)(70586007)(82310400003)(6506007)(26005)(19627405001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 08:20:10.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 531aada7-0d9d-49bc-af75-08d99ab4ec97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6431
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 08:20:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2312

--_000_AM6PR08MB34617A52B44CD1640FF9746E92879AM6PR08MB3461eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,



The meta-arm-autonomy layer is being deprecated from master, with bug fixes=
 only being applied to the following branches. Additionally, all support an=
d maintenance of meta-arm-autonomy will stop as per the schedule below.



    honister: End-of-life scheduled to June 2022

    hardknot: End-of-life scheduled to December 2021

    gatesgarth: End-of-life scheduled to October 2021

    dunfell: End-of-life scheduled to October 2021

    master: Code will be removed in the next few days



Regards,

Diego Sueiro


--_000_AM6PR08MB34617A52B44CD1640FF9746E92879AM6PR08MB3461eurp_
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
</div>
<p style=3D"color:rgb(32, 31, 30);background-color:rgb(255, 255, 255);font-=
size:11pt;font-family:Calibri, sans-serif;margin:0px">
<span style=3D"margin:0px;font-size:12pt;color:black">Hello,</span></p>
<p style=3D"color:rgb(32, 31, 30);background-color:rgb(255, 255, 255);font-=
size:11pt;font-family:Calibri, sans-serif;margin:0px">
<span style=3D"margin:0px">&nbsp;</span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;color:black">T</span><=
/span><span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;c=
olor:black">he meta-arm-autonomy layer is being deprecated from master, wit=
h bug fixes only being applied&nbsp;to the following
 branches. Additionally, all support and maintenance of meta-arm-autonomy w=
ill stop as per the schedule below.</span></span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack">&nbsp;</span></span><span style=3D"margin:0px;font-size:12pt;color:bl=
ack">&nbsp; &nbsp;</span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack">&nbsp; &nbsp; honister</span></span><span style=3D"margin:0px"><span =
style=3D"margin:0px;font-size:12pt;color:black">: End-of-life scheduled to =
June 2022</span></span><span style=3D"margin:0px"><span style=3D"margin:0px=
;font-size:12pt;color:black">&nbsp;</span></span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack">&nbsp; &nbsp; hardknot</span></span><span style=3D"margin:0px"><span =
style=3D"margin:0px;font-size:12pt;color:black">:&nbsp;End-of-life schedule=
d to December 2021</span></span><span style=3D"margin:0px"><span style=3D"m=
argin:0px;font-size:12pt;color:black">&nbsp;</span></span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack">&nbsp; &nbsp; gatesgarth</span></span><span style=3D"margin:0px"><spa=
n style=3D"margin:0px;font-size:12pt;color:black">:&nbsp;End-of-life schedu=
led to October 2021</span></span><span style=3D"margin:0px"><span style=3D"=
margin:0px;font-size:12pt;color:black">&nbsp;</span></span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack">&nbsp; &nbsp; dunfell</span></span><span style=3D"margin:0px"><span s=
tyle=3D"margin:0px;font-size:12pt;color:black">:&nbsp;End-of-life scheduled=
 to October 2021</span></span></p>
<p style=3D"color:rgb(32, 31, 30);font-size:11pt;font-family:Calibri, sans-=
serif;background-color:white;margin:0px 0px 12pt;font-kerning:none">
<span style=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt;color:b=
lack;background-color:white">&nbsp; &nbsp; master: Code will be removed in =
the next few days</span></span><span style=3D"margin:0px"><span style=3D"ma=
rgin:0px;font-size:12pt;color:black">&nbsp;</span></span></p>
<p style=3D"color:rgb(32, 31, 30);background-color:rgb(255, 255, 255);font-=
size:11pt;font-family:Calibri, sans-serif;margin:0px">
<span style=3D"margin:0px;font-size:12pt;color:black">&nbsp;</span></p>
<p style=3D"color:rgb(32, 31, 30);background-color:rgb(255, 255, 255);font-=
size:11pt;font-family:Calibri, sans-serif;margin:0px">
<span style=3D"margin:0px;font-size:12pt;color:black">Regards,</span></p>
<p style=3D"color:rgb(32, 31, 30);background-color:rgb(255, 255, 255);font-=
size:11pt;font-family:Calibri, sans-serif;margin:0px">
<span style=3D"margin:0px;font-size:12pt;color:black">Diego Sueiro</span></=
p>
<div>
<div id=3D"Signature">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"><span lang=3D"PT-BR" style=3D"font-size:11.0pt; font-family:&quot;Calibr=
i&quot;,sans-serif"></span><br>
</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM6PR08MB34617A52B44CD1640FF9746E92879AM6PR08MB3461eurp_--


Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC213C61DB3
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 18:15:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.63577.1673547346455390499
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 10:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zT7jrwDj;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV3z+Zl2NX9tn8NstYpyzl62S8EeUUX3K8gww9uGvss=;
 b=zT7jrwDjH0BVMICxyxCZl/EIBO35ySsMyCiARwycXBedz2uratWiK5fwo0VFGEL+4TcB31PX2jvmqwd2dwiWlSeMQLPSd0uk/J4a5aGkEQE8RZM8h2PAjhrVLrK1PN8HNiFifGGAYuc3FjW6/GJ9YwvWucV/tQzd6AVWZ3g0dwM=
Received: from AS9PR06CA0571.eurprd06.prod.outlook.com (2603:10a6:20b:486::13)
 by AS8PR08MB6136.eurprd08.prod.outlook.com (2603:10a6:20b:292::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 18:15:42 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::4c) by AS9PR06CA0571.outlook.office365.com
 (2603:10a6:20b:486::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 18:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 18:15:42 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Thu, 12 Jan 2023 18:15:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b18584eb585fd9e6
X-CR-MTA-TID: 64aa7808
Received: from b31e36b09fc3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45A7FE98-115C-4503-88E1-7C9ABFDD17ED.1;
	Thu, 12 Jan 2023 18:15:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b31e36b09fc3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Jan 2023 18:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzF5JYVT/a5ZrA4xQ6HhO5wdvVY4JJCHGchTd2b5MzlGiUdFEf2guz9cpKMXZEn+nxBSHjj86WjI3+drRL9zDko5dxM5UmbMHKg/9WxTTQ0LSWDT0SfuIyhjgNW8uaE/gU8gqIGa1DZs0EwMiTelT/a2N9Xlpb65LvpfKii6jpZV0QMBGQjBTpAyJv7q1XxeMvFGEsHs3SgoG90io63g86amSH+3Kn/pMuy42tjsJJ1rOEP1r0MXzBmxFsw9ZdEMWPsviSU7ZVe87D8+/rc7YcxlHsZ0bhLUnd4Yx8qaKG3PQ6Ne5D/Ocs3L+d53amuaYuY16yaahTcDn3nFGUp2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV3z+Zl2NX9tn8NstYpyzl62S8EeUUX3K8gww9uGvss=;
 b=C6f/z8jwu1ihtnYhhfVdEE4nxEdekhT0SWH2DxVPlEbBPw8e/nKTil/4DDlPx65k86ZR1myobLNZJLQ8hYUSTQQSumwIhTV31DzVNDBoowAJJo0cwY3y3GbolQFOWfPasuxoBXPFWIqMq4sj2DPsHQvv2tygmNvOGAUccg3EewUWXQZ2lNJt1cjR7P/0IfUmFD56sJYcw6keymtnm1eDDli2Zi1vuCo6dzwBZO1XTOwsyXFiCE5Hjdiq5NlnBjVYIqglkkC373wsymDumDbIP22eCr1lTLQcm9qd2n3Up/nk73Bm6I4CZkSE9g8rvA3IhYBHLXF6MNF8xopgeqleow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV3z+Zl2NX9tn8NstYpyzl62S8EeUUX3K8gww9uGvss=;
 b=zT7jrwDjH0BVMICxyxCZl/EIBO35ySsMyCiARwycXBedz2uratWiK5fwo0VFGEL+4TcB31PX2jvmqwd2dwiWlSeMQLPSd0uk/J4a5aGkEQE8RZM8h2PAjhrVLrK1PN8HNiFifGGAYuc3FjW6/GJ9YwvWucV/tQzd6AVWZ3g0dwM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9286.eurprd08.prod.outlook.com (2603:10a6:10:3f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 18:15:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 18:15:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Emekcan Aras <Emekcan.Aras@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Jon Mason <Jon.Mason@arm.com>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Thread-Topic: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Thread-Index: AQHZFUofuy3zhgUlSUK3WooNTtzQBK6bNIOAgAAEl4A=
Date: Thu, 12 Jan 2023 18:15:26 +0000
Message-ID: <ECE5710C-8554-4807-941D-A4E6B0715A3E@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
 <20230112175859.GZ22689@denix.org>
In-Reply-To: <20230112175859.GZ22689@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9286:EE_|VI1EUR03FT021:EE_|AS8PR08MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfd07c7-1d0f-4aa7-cf77-08daf4c90435
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jkvHwF8OLLXkyFZW7njkzyh9uxVjqjmtV0EWmNkoRSJ0qUEzTJlxLSjPLm4ipcFi8rqL0IL3vJnYytA0NWPzcLrU1n8EqMDwjkmRwSBjoFFJDYA+/QlUtxIik2RAcPDaBEOaCiVrSvh4Q5t90c8PKoroypG18bSSQRLwAVQjVZNFC5QZkz5VPG/BuvkeFhTHaWpuqcROVPbz2tdOZ+/PhOMsbDGb0p5qzJ5DQPFtDtMv6A4FI/NgJUMUtep3YubxUQC4BiH6hrRvCqH41y8sHykppZZMcqHPEHM3xsKeIEftQPrv6QAF2+xsBTZRxde37fpyJq9F57K4FNVxszneC2qsIJvdbukTH5AtzWcp1+a7uVwJNTrrf7O91149CQd1B6ZOBPJFp8hK3uy9uBxEsd59y0sy3p3t0kb6JuIQSB2J/9xaiZG7EzkXtKimA9YIH+/8mVquFbQBHHSnsx5g0jmyDrBkNrRfio1HkUStJNJi4N4CynVV07F1MBf8UCM3tr/KNxx6aFAvo4SPKljV5gE1yBvemR3RykyDhSSj7j4PumZI3YhWQY/fBSY0HelmuYOKVR95GbDbjdvCnbAYydTZhGy0m184zsCFfkLRrFThtSS2E2hFqxJZcT/ficJA5xIms062mIbLBNVwM8DuN6942EAPj6zg0ZRr5al7uIdxEJPNOO/1nMyTv66mhonF66wOJV7+ki8QATFU4mpVJdDg31/3elSRxwAi9HUvHTUch3xm2EzJpp/vQL/nEtKJ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(2906002)(41300700001)(36756003)(83380400001)(33656002)(91956017)(66946007)(8676002)(76116006)(66446008)(4326008)(64756008)(66476007)(66556008)(38070700005)(6916009)(8936002)(2616005)(5660300002)(86362001)(478600001)(6506007)(6512007)(53546011)(6486002)(186003)(316002)(122000001)(26005)(71200400001)(38100700002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C12C6FB1866BA4CB40417DBF85E659E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	14fb017a-e41b-4043-9aff-08daf4c8fb1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DV6Ca/ZOyiUj5dGC584EEx3whYi4A8/YLWzz+zHRwI6xs0qGjKTGoFcsZ8c+dzclOGEWsQ4QrL/82zqVkBCU+fASeAS5oKnbnYMXZFaKOlSx3X4TPLqKaLZzPe7l0DTXNdAdEXEbbhExkXX3AUJZJlHBiGBQSzh3Te2lQhjgfCyhXl3fGWDPpnYiznbNDSh9vz4CgIFYWdy9omdXgBO5M023+SktFKf2emokGDmu+6HllRqMIR/pfQZ2c5ojjkMj31NWUV/1yp82tvvSzmt14ripKJ7Z4YdS0+DpgIBuQfnmYAzgUABQTCcRbK9ueag5n+LPoWIhSsxXX2F2GAM4Vnm5jUxtoMCSisSmrMBxVB03Ey5bgcmUJ1FB6n90fZuqXEj+TdP0E7QK5xlepbGlxiFtzCh6Z3xMWeBxS0F6u4y9xk9MExE8h8KjHmplDiOB6ko82WGbBz+YWAmG1iBti3htVIgiJpwFy7BF7pPQfayDrWSpSypPIOESQL6kwkEBiQ1U2jaVJ/UB39U7yjicuHTz9TCPyDEbhZSYsdmb3BX2KCCvaatiIAU1D6jbVp2hdvhZVNbBIZRpWMvBWoon1aKdNvGh2wWRn+0RrITGxfWkaCXZV7ej8378T9d5davcgkl9mk3R4l8DIK08bBpUoCgRtOXQek3T7qRcbG9qEXurUIfrfi2t+ozyDFY4Q5/EfxF+JFCoj/gQAAmMagr5hmdzajPD1NZppHxXNFw+Klo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(6486002)(36860700001)(2906002)(26005)(478600001)(6512007)(186003)(53546011)(82310400005)(6506007)(70206006)(70586007)(336012)(316002)(4326008)(8676002)(41300700001)(36756003)(83380400001)(2616005)(47076005)(81166007)(356005)(8936002)(40460700003)(6862004)(5660300002)(33656002)(54906003)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 18:15:42.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd07c7-1d0f-4aa7-cf77-08daf4c90435
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6136
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 18:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4276

On 12 Jan 2023, at 17:58, Denys Dmytriyenko <denis@denix.org> wrote:
>=20
>> ---
>> diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-ar=
m/recipes-security/optee/optee-os-3_19.inc
>> new file mode 100644
>> index 00000000..8adb6996
>> --- /dev/null
>> +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
>=20
> While not critical, why does this inc file has "3_19" version in the name=
?
>=20
>=20
>> @@ -0,0 +1,82 @@
>> +SUMMARY =3D "OP-TEE Trusted OS"
>> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted =
side of the TEE"
>> +HOMEPAGE =3D "https://www.op-tee.org/"
>> +
>> +LICENSE =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55e=
c173"
>> +
>> +inherit deploy python3native
>> +require optee.inc
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3_19:"
>=20
> Now, this is critical - why is there "3_19" version in the directory name=
?

Sorry, these were picked up in internal review but the series accidentally =
got merged.  Hopefully Emekcan will be sending fixes shortly.

Ross=


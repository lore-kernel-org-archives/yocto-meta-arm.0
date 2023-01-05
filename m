Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35285C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:32:22 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.41])
 by mx.groups.io with SMTP id smtpd.web10.15704.1672932738482985560
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 07:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Qa5eUFnL;
 spf=pass (domain: arm.com, ip: 40.107.247.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OX4xCx2G1PBN1ni4za/k5jYubjeauO8nj/CgbUBEzMc=;
 b=Qa5eUFnLo/68ZN9/JyDqABMJPKNO5Xbm2HKU6sLKkK393MyVvJkimNMncd2LHt9cl/+GS96v8zmKiMTyJwBNifrg9mttjNbstYgtX8cx3topjml+USp9oiRmKufjAGew639yD6aggSaItwD90fTqERQuFD4+seAYSntq5Oy7KWI=
Received: from DB6PR0802CA0040.eurprd08.prod.outlook.com (2603:10a6:4:a3::26)
 by AS4PR08MB8095.eurprd08.prod.outlook.com (2603:10a6:20b:58a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Thu, 5 Jan
 2023 15:32:15 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::fa) by DB6PR0802CA0040.outlook.office365.com
 (2603:10a6:4:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Thu, 5 Jan 2023 15:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 15:32:15 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Thu, 05 Jan 2023 15:32:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56b9207437988881
X-CR-MTA-TID: 64aa7808
Received: from 021ac9d208b6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C7F26F9-BA35-4A68-B17B-1967C7D02F16.1;
	Thu, 05 Jan 2023 15:32:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 021ac9d208b6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 05 Jan 2023 15:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWRwXWfJ3FDYfm7VpgyWPpuaU1VNo//pq7jCsDBwYfiesVbO2fsriA063Ob/HnMhtdPKRZODSCEKnAi9b3Mvi90r1AOGXNa2Bkayi7Bq5HIgUpRv+FaX8LnOYD/uZPfSZtv3I0sEV8bPoUUaRb7QBBna02kWWVqZz2iRaZJvp04lYr8qGBFdoWpmBSQhqfGKpWYjOTM3/97VmShqXIHb74arKTkjx6jUoLhQxDr37dc9+wdXLx1KZIlsMhzlRfOCwNymiq2vSapNwNmad1fr14rMmMCtpUiZuLf7HZ6/VImx5S06atsCLufgyH8O15h0Ur8KikhyWWKeIGv6Z/Ns7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX4xCx2G1PBN1ni4za/k5jYubjeauO8nj/CgbUBEzMc=;
 b=MsmlflV84OJVnRbvLOkUIMY/K9Y8OSQFgCGby9WpVVUm1oyD2RRmvTUGeC0Vo+jQxRS0n88TH61Q5pnvAg27bFytcDRBqzNwkpjqqWWrTSwLBnwnNqN+1QfLw37blQBvoBD9CfRfk9pZ7Z/ZqlUcTsNscAJ3ZQWq5mJL+cblckzcjVCtGv30uwIxirzbShxi5Exjc/4f8XXFU9paFdr764VALuo1xfpJI31JuCMxEHtCSBDoYbX939ZEeixBDjEJXDaOOqnhLfRFIlc2IMkDDGt1VHWGJNAAZQeftZ82UJR3VfKo3aRy8C7eacISPQZdDL7OUv58QbqavjInejzXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OX4xCx2G1PBN1ni4za/k5jYubjeauO8nj/CgbUBEzMc=;
 b=Qa5eUFnLo/68ZN9/JyDqABMJPKNO5Xbm2HKU6sLKkK393MyVvJkimNMncd2LHt9cl/+GS96v8zmKiMTyJwBNifrg9mttjNbstYgtX8cx3topjml+USp9oiRmKufjAGew639yD6aggSaItwD90fTqERQuFD4+seAYSntq5Oy7KWI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7462.eurprd08.prod.outlook.com (2603:10a6:10:355::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Thu, 5 Jan
 2023 15:31:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.014; Thu, 5 Jan 2023
 15:31:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
CC: Emekcan Aras <Emekcan.Aras@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Topic: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os
 version
Thread-Index: 
 AQHZFUoccV2REkXifUytQeLG0vlMMa54edSAgAAGAACAAPh3gIAAH8aAgAFhhwCAFRF6AA==
Date: Thu, 5 Jan 2023 15:31:58 +0000
Message-ID: <CC932BED-35F8-424B-9ADE-A6DD79B8C1AB@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-6-emekcan.aras@arm.com>
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
 <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
 <CAFA6WYNyRUxHCM==QRYYFbHv2g=OACcrfDhP52ydNtxTpjCV_w@mail.gmail.com>
 <DBBPR08MB48384A6FC8780E6DFCE384698EE89@DBBPR08MB4838.eurprd08.prod.outlook.com>
 <CAFA6WYOHFj7LLtnc9jEQfZwLXAkFQDwg-FCOdoXGxjge_a5JCg@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYOHFj7LLtnc9jEQfZwLXAkFQDwg-FCOdoXGxjge_a5JCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7462:EE_|DBAEUR03FT012:EE_|AS4PR08MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc5c3bb-30aa-46ca-22ce-08daef3205f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mztEur0kSJB6+VmuQ8t5vXf8xoTuQ0HOf4eF1fbPbK9gw8Nq6Tsh6gkQixlk95mvSmOEKiQNT1ObfdFsm4q31l7qVBjVinsXrM2t3RoCRdx8ru01HnagTvCwirni+VkxvZ7Cv9lmhdjMvqcVSJmjaAscw+GyAR2gpJ10jwKd+e9bm3D8OjLeeb4qVhrHpuicRQqxT8hu/8IBNDpC8lBp7EKOdTNGRM/smn4uSB0WyjQoeuUvvNw+Wb4ilXGhY7VnP5g14okfayRLB/XIPJOAMw1gpQQxyWVwZpNyteYDXb587hvG3KrPV3m0vkQ3T5uIm19Rtfu5GNqJe76S2gyvtmBXWjQmSwEQVmmWwRyKOkYFf2jJbpwbARridDvqwi0fHBkcYqRCFHDPpWEEhcPyeWTCkUsZ+huJV8QZms0BqSXyxu/2PkG8cciNwLXWxf59q93dfP8FX4BDNlqESQ6EjWgJoYaM18LACwPaS2MGXIRfFRCbXFY1gO+VE+T1qrySiwFpmavDOhI1DO4J8oOL/XQJFRxGcCXuhaF0rzZ0q3PENFAXzTbu/nAqeH1xtwe1L/itBA4pAl2GBHjHzItggm7VhNAcHQTWE4PFD1jkb1+U2IXqxtTa3l9onG9q4m3Mpmf96Sh/vaGoP/0OETnav0iD4dHPCunHKEPxxZE1AVN+boKa9y78NC+MAlY8ZKkjcWEKwjpnl4ClwY2bJ7AYlzlZO94SRgejX1XboLinS7I=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(66476007)(64756008)(8936002)(66446008)(66556008)(41300700001)(4744005)(5660300002)(36756003)(122000001)(2906002)(2616005)(38100700002)(26005)(316002)(6486002)(54906003)(6512007)(53546011)(91956017)(76116006)(8676002)(86362001)(186003)(6506007)(4326008)(66946007)(33656002)(71200400001)(6916009)(478600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5F818E7080D27428CF2258CDAA18AED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	02080237-4c56-4a9e-a713-08daef31fc1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z6AMdWJolR8kmDPGUW20sOs7sf4sV62mcncCpOrVJrDJr71Fq5LN9/nzbjLemiciFSOSja8E+lLj4bttQFf+y4x9CeEfLuxORRh06CcQyaIWPgbNHUjkofwamg2DzmKDXKRkDNOrjKYjmdllGmO5N7nxAfPkLyrweKibJjSdwWN+17KNcjb+UBlMLAiRZtufRhVoxhFfEuAwZFrWTSujNt/T7UqNLRUB/6XRC4HI1DGTLtYl/XQDXVxI1alh29sMUSr5o0+Xe0Anlw3aLynLmzOY0Sgh6dlpzVRJ0PKbfLEQmwhC36Yw8MW40t6IojJCMEJH8ELsGT6eL15sXvKCFvDErKfKZT4/V0BvPJQxjWCEPHatFEBrRGS5OOdOhlnC40ud21zwU1WKjr9GeELP4KFZDk3jsHn4LgO27zJG3ev4aKn8a3PmBmpnrwzN1ult/WblH/waOIVHX6kgNCiS9Qavm8vYFVDDkxuCfVJzjy4V43cnv9hX4LzmyOf+PMZSejLleVUaIZIRUDkPxRiQ4WqfY4+HcnQr57JpLcU18wkwqu123HaJQGUAj5zjMgcQpXmNcwZktKo2qFtn8DEEORnal+xh1YPt6GTTk8vmgn7JfuaIj3PCBpB5lDXo3XqgBNnVsiMd8VNaTs9Fs3FOB8iqbJ5hNBtgvsZudqDif9D9B5XQ7CVJniFdrACgQO1vmo8+07OvcX/a+Rn3c3//IA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(8936002)(36860700001)(81166007)(82740400003)(33656002)(356005)(41300700001)(70586007)(316002)(8676002)(70206006)(54906003)(4326008)(86362001)(47076005)(186003)(2906002)(6862004)(40460700003)(2616005)(4744005)(82310400005)(5660300002)(40480700001)(336012)(53546011)(6486002)(6512007)(26005)(6506007)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:32:15.3348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc5c3bb-30aa-46ca-22ce-08daef3205f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8095
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jan 2023 15:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4237

T24gMjMgRGVjIDIwMjIsIGF0IDA1OjQ3LCBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5v
cmc+IHdyb3RlOg0KPiANCj4gUWVtdSBzdXBwb3J0IGlzIHBhcnQgb2YgdGhlIG1ldGEtYXJtIGxh
eWVyIHdoaWNoIGhhcyB0aGUgT1AtVEVFDQo+IHJlY2lwZXMgdG9vLCBzZWU6DQo+IA0KPiAkIGxz
IG1ldGEtYXJtL2NvbmYvbWFjaGluZS8NCj4gZ2VuZXJpYy1hcm02NC5jb25mICBxZW11YXJtNjQt
c2VjdXJlYm9vdC5jb25mICBxZW11YXJtLXNlY3VyZWJvb3QuY29uZg0KPiBxZW11LWdlbmVyaWMt
YXJtNjQuY29uZg0KPiANCj4gU28gSSB3b3VsZCBsZWF2ZSBpdCB1cHRvIG1ldGEtYXJtIG1haW50
YWluZXJzIHRvIGRlY2lkZSBoZXJlLg0KDQpJ4oCZbSBkZWZpbml0ZWx5IG5vIG9wdGVlIGV4cGVy
dCwgYnV0IEnigJlkIG11Y2ggcHJlZmVyIGl0IGlmIHFlbXVhcm02NC1zZWN1cmVib290IHdhcyBm
aXhlZCBpbnN0ZWFkIG9mIGxlZnQgb24gdGhlIG9sZCByZWxlYXNlLg0KDQpBcyB0aGVyZeKAmXMg
bm8gaGFyZHdhcmUgcmVxdWlyZW1lbnQgYW5kIHJ1bnFlbXUgd29ya3MgaXQgc2hvdWxkIGJlIGVh
c3kgdG8gdGVzdCBmb3Igc29tZW9uZSB3aG8ga25vd3Mgd2hhdCB0aGUgcHJvYmxlbSBhY3R1YWxs
eSBpcy4NCg0KUm9zcw==


Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBB1C61DB3
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 10:39:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.42])
 by mx.groups.io with SMTP id smtpd.web10.82992.1673606345411872902
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 02:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fkvor7+0;
 spf=pass (domain: arm.com, ip: 40.107.249.42, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znMkNjeymkKc2y4R19DqXLB3s/Sx5JHSkDw3lLmpFJw=;
 b=fkvor7+0MF/K+3Ie+NU6PqFq7tREuwZ4P2M9ldw3A+Mw2RJsYNDTgdF8vfeZQKmQ0EjKLxEtyTmbU/MfhzzKpBvmuqjMkph5sHxu9ajf3qJIY/6InBilmVADC6YoVbsFG7Hfotq3I8qIDo0E5lDFEc1fmjTpZitps54FzMc1H08=
Received: from AS8PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:311::10)
 by GV1PR08MB7314.eurprd08.prod.outlook.com (2603:10a6:150:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 10:38:57 +0000
Received: from VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::76) by AS8PR05CA0005.outlook.office365.com
 (2603:10a6:20b:311::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 10:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT005.mail.protection.outlook.com (100.127.144.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 10:38:56 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Fri, 13 Jan 2023 10:38:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f191ed48c74ccb68
X-CR-MTA-TID: 64aa7808
Received: from 50a18ca9d03a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A3A52900-9456-483F-B9EA-9731E6FD766B.1;
	Fri, 13 Jan 2023 10:38:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50a18ca9d03a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 10:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKKydy9vHf9r7adis3OfqtC58WhTPCFveKiFPCRF0Y09q9ZSc3lRfHzo63Dpv/fo/MCTJCTQziCas0ZaIfEe8UHGfS+6jTiw4ZSJahUMSQTWFu9JIouSApDdxRtNd+tmUMOGPfwTdI8Yyw1fjaVo+/oFjSTMdqQGDJe5uGZi0MYdN+mkImB8gUHJqlCrvx0ut3LRMA7vqW6jeYu234s/t0XZVVCuOmHTZ6FfLCcasH/tHjAkvl4tD4q1xSxv+Ia37AGcb8dWNanvGAa0lDZm2TlqtRjxdCAuBds3W3IuayT+UfykBYAb/imRM3t2PK2F20UcbSScnarV7lTI/l4YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znMkNjeymkKc2y4R19DqXLB3s/Sx5JHSkDw3lLmpFJw=;
 b=aOhjipbSnnXbUhxPzezYKrFHgIm3fnvk4Yjcvjs6wnaMsk3XEhIDxdy0/Z7twb/wzrFoAB7U8akWwPOZ5NnH22CEezlaO+lClEkrNu2Nb/5IiPy1DMBR07LjcPQ7oIHTlALfWMTJyj7j1LI/TSeUA4gys1QnnTMqKthMPUQnGaoSCa87sn4+/5T6ylEZEAPXi9e3+6UcpMA829XNxFxvt9V649loAS6dRY4wMMNOaT1vP+lhZbT7N2PqNM6ins38VzIo+mAMiyc2jcJJCBRFziIsxsFzzwhY3Bw5N0BAsA9aRwVxYn43PCQ1T/4yFiZ3sQQhzyNp1pKJMoIj0D/+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znMkNjeymkKc2y4R19DqXLB3s/Sx5JHSkDw3lLmpFJw=;
 b=fkvor7+0MF/K+3Ie+NU6PqFq7tREuwZ4P2M9ldw3A+Mw2RJsYNDTgdF8vfeZQKmQ0EjKLxEtyTmbU/MfhzzKpBvmuqjMkph5sHxu9ajf3qJIY/6InBilmVADC6YoVbsFG7Hfotq3I8qIDo0E5lDFEc1fmjTpZitps54FzMc1H08=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9274.eurprd08.prod.outlook.com (2603:10a6:10:41a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 10:38:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 10:38:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Emekcan Aras <Emekcan.Aras@arm.com>
CC: Denys Dmytriyenko <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Thread-Topic: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Thread-Index: AQHZFUofuy3zhgUlSUK3WooNTtzQBK6bNIOAgAEKc4CAAAzQAA==
Date: Fri, 13 Jan 2023 10:38:41 +0000
Message-ID: <A1B4DABC-7677-45B7-A68F-544D59EBF556@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
 <20230112175859.GZ22689@denix.org>
 <Y8Ep5xNEyubVMHRj@e126835.cambridge.arm.com>
In-Reply-To: <Y8Ep5xNEyubVMHRj@e126835.cambridge.arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9274:EE_|VI1EUR03FT005:EE_|GV1PR08MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c56a41-93d4-49d9-9f62-08daf5525f9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1tRq8YnIiRmzdCkuFdRJnX7ZQAVW2CjVV1+ycmRbsq6dPTZlMko7LEgvRJ78OUojvLA6iSC23tKiFsuIn4jyNVQnZgSq622pAVXTSuWSZjE8AipnG+UFqr8lUT8oISH3yFYLVSu0XqCJEWOeconiS4rUOrO5wyWy5KTsh4aWzax9Y0T/J/sjFCjOYP97r9AbLpBPgIrEBSKNjfD/82KUzolQRM3XbDpRUGPrcBnBTyMuZF77sN2OeKBYq0wFQqGn/JdFRoArJnYIOpgkWSh0p5TX/XaMU6sQ7n2zu8c06X87d++o727yQ3I/UP0R/iUDLDl86flnn+di/R0E7JnMECZquNXus9Dz6EeTBE7Onidcqk5XtYccfw7shzauu5yoi2u2RFathCwOi3BEcQvQJFN/Rd0bpF4zsC9ZXgDkMnbAP4d/w1Dr6h+VJBxfNkp6RGM7gA3khFXfSM1jVS5ZjYx/MZ7EEdBCYSo7NkG/U4OP4a/w/NpnvZkVup6KzNO8VX+enUL8W+Tdu4W2QKEAXyt1E7zAI9TNIS/HC2FZXK+BU1rROxxWHMH+B33AcQY5TLcWsZzLYOksoRrkOIDFUcRU0hvPjC+PeXQct3MDtp8eFaaGZVNR0BupBsvFmjs9TtmL9Bs+1PH/j9gvFpbP+JJzMswBhGrmTytSNzpw92SaBv53P4gygJ4S/1unZUWjfGweckMYoj1T8oJGMinZYKwMcuCKWciMkM7npmuC0vk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(83380400001)(86362001)(33656002)(122000001)(38070700005)(36756003)(38100700002)(37006003)(316002)(54906003)(6636002)(53546011)(2906002)(76116006)(66476007)(66446008)(66556008)(64756008)(66946007)(41300700001)(91956017)(8676002)(4326008)(4744005)(8936002)(6862004)(5660300002)(26005)(186003)(6512007)(6506007)(2616005)(6486002)(71200400001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <317D43A9FCDB28429B7762D12A300BF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9274
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f483c9b-93e1-4168-aaad-08daf5525657
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	270e7eygIIhPjRgBuoi9u83bPU7LR9YXQW62Vzf6U8yYDjmD0ww91lVj/hm3Snu+u7fVoI0lW7vZQquJ2wKBwp76eeY+qVgNEdODKVhIR4zAn/Br+AZvKIVmHv0kdrE+Mru3AMvR+Y2wqT1Tao2EFIeDqGzqqxvfIoNqPAxLA190lsJmTgOD2GHaM7YcaqBdSRfuZLJtL2t50ZnVoxzUVtp0i1sepHZ9FCgkxbPGsFTGeVNGHF6Hujy4otvGf+ZpenK5L2bd4ZH0C9yy17n4BLxPu73FXdxB5zqsCE8XwD1kxZPh6JIYgjFnjzoUjK7N4zsEXBLvYgVd7ewL+u4W4HYuIj4WLPT5sRckqvRrWl7NN9nHpeu4hGBIlV+l5TCeFa6qa7uvjuNF3N0bMmLBg1OMiPSC2IX4hZKFvVjyxZ49PAM8DXluA2fbeLmSbWPrjvywNRalULDNSHoq26gst0oRt4OOs6gd/T+I5j1PgjsVqgiag3wVVzXGSZ+Iui2sgJhjK+1+cLokWDyZ9ph2phsy3cY6TZBFfGDoFBDUk7N5NRGS2ngblpUIs6+3RcK/4GoR12n/cxUK+miBXoip4lCb6/kMfY6rEhZ5QGapX9uBMdhOa7lO3Q+wBNa0t520YeSZCE6FhgcaFD2nrJd7Mv3ew6q+QYwCamtnzlXTdlY8zXVVhA+ZMD7GpjpuV259tDQf83Ub09dJmNGDnY9AUw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(33656002)(47076005)(40480700001)(40460700003)(36756003)(4326008)(336012)(8676002)(41300700001)(70586007)(70206006)(83380400001)(4744005)(53546011)(6862004)(6486002)(26005)(478600001)(186003)(8936002)(6512007)(5660300002)(54906003)(6636002)(37006003)(316002)(2616005)(82310400005)(356005)(36860700001)(82740400003)(2906002)(81166007)(6506007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:38:56.5345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c56a41-93d4-49d9-9f62-08daf5525f9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7314
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:39:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4278

T24gMTMgSmFuIDIwMjMsIGF0IDA5OjUyLCBFbWVrY2FuIEFyYXMgPEVtZWtjYW4uQXJhc0Bhcm0u
Y29tPiB3cm90ZToNCj4+PiArRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJUn0v
b3B0ZWUtb3MtM18xOToiDQo+PiANCj4+IE5vdywgdGhpcyBpcyBjcml0aWNhbCAtIHdoeSBpcyB0
aGVyZSAiM18xOSIgdmVyc2lvbiBpbiB0aGUgZGlyZWN0b3J5IG5hbWU/DQo+PiANCj4gT3V0LW9m
LXRyZWUgcGF0Y2hlcyB0aGF0IGFwcGxpZXMgdG8gMy4xOCBhbmQgMy4xOSBpcyB2ZXJ5IHNpbWls
YXIgKG5hbWluZy13aXNlKQ0KPiBidXQgcGF0Y2hlcyBhcHBsaWVzIHRvIGRpZmZlcmVudCBsaW5l
cy4gSW4gb3JkZXIgdG8ga2VlcCAzLjE4IHBhdGNoZXMsIHdlIG5lZWRlZA0KPiB0byBhZGQgMy4x
OSBhcyBhIHNlcGVyYXRlIGRpcmVjdG9yeS4NCg0KSXQgY2Fu4oCZdCB1c2UgdGhlIGF1dG9tYXRp
YyBzZWFyY2hpbmcgZm9yIFBWIGFzIHRoZXJlICphcmUqIGJiYXBwZW5kcyB3aGljaCBidW1wIHRo
ZSBTSEEgdG8gYSBwb3N0LXJlbGVhc2UgaW50ZXJtZWRpYXRlIFNIQSBhbmQgY29ycmVjdGx5IHNl
dCBQVj0zLjE5K2dpdHtTUkNQVn0sIHdoaWNoIGlzIHdoeSB0aGVyZeKAmXMgYSAzLjE5IGRpcmVj
dG9yeSBiZWluZyBhZGRlZCB0byB0aGUgcGF0aC4NCg0KSeKAmWQgbGlrZSBpdCB0byBiZSAzLjE5
IGFuZCBub3QgM18xOSB0aG91Z2guDQoNClJvc3M=


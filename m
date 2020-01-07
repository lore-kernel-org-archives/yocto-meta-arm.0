Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.78])
 by mx.groups.io with SMTP id smtpd.web12.13212.1578436546591349082
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jan 2020 14:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=S6xRFyUL;
 spf=pass (domain: arm.com, ip: 40.107.0.78, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VEMKAQO8ZxgAcrVcmZnsQgivFhphWCl+yCWLv4hNeA=;
 b=S6xRFyULFBazXIC7jXLpOoZAAqabEOUo03Fo6HKgEN+9CuTOECTCmLoGoHC1MtIK0+/r690IapNJpf6e+e8qUNUvYbyIxSzVfzi8oMVaMTkJKjlDrc7jEpK8poxnh8kT6mCLXgRtycQ0Nkf3YecZh6gJbsUetlfwC3Bdy5ARVwY=
Received: from VI1PR08CA0131.eurprd08.prod.outlook.com (2603:10a6:800:d4::33)
 by AM0PR08MB4596.eurprd08.prod.outlook.com (2603:10a6:208:101::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Tue, 7 Jan
 2020 22:35:44 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by VI1PR08CA0131.outlook.office365.com
 (2603:10a6:800:d4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Tue, 7 Jan 2020 22:35:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Tue, 7 Jan 2020 22:35:43 +0000
Received: ("Tessian outbound 4f3bc9719026:v40"); Tue, 07 Jan 2020 22:35:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac984bf54ab86040
X-CR-MTA-TID: 64aa7808
Received: from e0de492b6972.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5BFD96D0-9C1C-44DE-AB52-D4CE37A22281.1;
	Tue, 07 Jan 2020 22:35:38 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0de492b6972.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Jan 2020 22:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYcoExObHRKQi3AqgLp5CYRwKumYZUxHwR2MNtQJkYq1CK6P4gfCgwMNBvNLS1gG4qIYzOP+Os30J/w1zdAo9w+MlS7atADQ+JCYiaOhjsVJbPpXmPcgeEulNcrj9G5YpBEgR+MIrOz6Pfm+W7KcaiQq8g2aq5+7h51DOy5Jqqu6el+WTjl6NoL/aDGAn5rg/p05CST49jvR39gXwWo9ZAo6bfZzJnQTsjKWA9CEZjQ7dhqTdhADUCebc98h6FjCfqUZsI9986Kbqvue8fxXaWHQRjB8i7wYfHWYJru2RJYhrYua1rGpyQ8uX8fS7B8f67rvuXay7K0Y7HybfPO5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8YuP1EACNwf0XAp6qW9Fq3H/UzJCqthlgAGcCxVRyc=;
 b=GPjKUm8VgWwNw2UeMmfCpPdXy3xORZAZrVlK15usfGpuszCGlxZFasvQJAOXgTaK6USRGFKUbjYp7LtXjNZ4eg6ZfBH8Z0CwxSxUhxQHKAoJCSPleGrdQRKlKeHhLZ8T+BDlHtmbr9oeakzkyGpkQHGZa+G7NcykReNP9eZTTEMxkN+kN4iFqAV46NKcmJJQufU56iJ01nSnEX+HfncUcNXbLY/qdo2zVTucGhy3tT0S5OsKzrGE9YlaILLZYouY66vlTfVw/tPfHoFPXRLNBeexSxJNY3HBhszKUD9T2qDdKhCuHkYixn4V5GYVNjXzVmKkhsA67wVY9CfMHHI4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8YuP1EACNwf0XAp6qW9Fq3H/UzJCqthlgAGcCxVRyc=;
 b=fWqWW9XHJ+xhcNHV+oSt4VpJRRltDacJL3ULo8mWO7GudpiElteRlJyC9P06dJKJ3GSMgYwGzhZYaUjFtOKhkZTjvBN3PMWi5/ptLq0TxBXpzsiCXcM+jTVwqixx53uX6H6u7w83qtVmu4wjmSzEt38jjQawoQUPae/huD45wQQ=
Received: from AM6PR08MB3672.eurprd08.prod.outlook.com (20.177.115.76) by
 AM6PR08MB4119.eurprd08.prod.outlook.com (20.179.3.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Tue, 7 Jan 2020 22:35:36 +0000
Received: from AM6PR08MB3672.eurprd08.prod.outlook.com
 ([fe80::c858:6461:83aa:ea43]) by AM6PR08MB3672.eurprd08.prod.outlook.com
 ([fe80::c858:6461:83aa:ea43%7]) with mapi id 15.20.2602.016; Tue, 7 Jan 2020
 22:35:36 +0000
From: jon.mason@arm.com
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: meta-arm layer update
Thread-Topic: meta-arm layer update
Thread-Index: AQHVxarHt+yyZd2TG0G/dNATbTj8aw==
Date: Tue, 7 Jan 2020 22:35:36 +0000
Message-ID: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
x-originating-ip: [2605:a601:a638:2c00:e4e9:8162:f4cd:61b1]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 783c853d-0566-46e9-2322-08d793c1ee98
X-MS-TrafficTypeDiagnostic: AM6PR08MB4119:|AM0PR08MB4596:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB45962EFE94F56C9CD3729C4AF03F0@AM0PR08MB4596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 027578BB13
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(2616005)(66946007)(76116006)(81166006)(66446008)(64756008)(66476007)(3480700007)(6506007)(6486002)(186003)(8936002)(31686004)(71200400001)(966005)(66556008)(478600001)(81156014)(8676002)(91956017)(31696002)(6512007)(4744005)(5660300002)(86362001)(36756003)(2906002)(6916009)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB4119;H:AM6PR08MB3672.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 slSyByp1DTzH+4Tf/IYkZRf0QY+4kze2rAS29nq0RIIajXTT0v6iWNKY7qy0NrZ4ZQJkFo0auJY/WsbeW80YujhUjaLfxygNogpYizd5qxUZilMUhqyplVz3lQYrZo3y+gLJY18ECCCHLjh3x3v2QMa1gsSc7GehbNYmuv24peh/RwWt4PTJwNy4tYgQNHRSETBVgDRqjBgHVraDLpcBPjzu3iC6IGLPAYg4krSToF2Th35G4v32MkUlouesk5vlt7UPeI4HukwGx77Rb/HYAYvdo5g3S/xwgwRVLIy7B6JifolAcIsHDK7F9jVlyNUbp1/OvS0v1OWhyTeIKnUDhicosO9HX8vk/5tkMGldNxQ+Sqy5yrhldZOIxgmQZWW2bg0SfSARq9b7OZQeZooGvHkcYY7g9So9Cl5btdZWT5GPZ/99Uan04+cXdqvL8eORviiTUlsDL1eidPTdJCPlPzm3gDKSptCIsK8dVy1l/U3cwHneVmBnuuS6XNi41J2W+596OwiOh2kDv5T+/cUewQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4119
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(40434004)(6916009)(2616005)(6512007)(6486002)(70586007)(31696002)(70206006)(86362001)(31686004)(966005)(5660300002)(478600001)(15650500001)(26826003)(316002)(81156014)(356004)(8676002)(81166006)(8936002)(2906002)(6506007)(26005)(186003)(336012)(3480700007)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4596;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62efa890-47b4-490e-db74-08d793c1ea86
X-Forefront-PRVS: 027578BB13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ZtZ6nL1Qf16kmNXwamiFIrn5B+PIgTQ3bevWkL35gk20TqXckWht3qok7wShfCCs4c9+5Tw9l0k3052A3ZzgdWjghaPnLWe41JJe9M89wlUZOsv9rHyTMocLpaEUrUgyiQVZWzOFz5ysLRoPxHSsMirNthAGuV5FTSwdOzWxCL1LIHsz+KNw28bX24OKNCFXhS9DXfKPcmalGPexCadhauz36WFVQ/PF4nNEa4lSBJ6Lc3zVqoxfnrn0/QrRpQWWhhCdv44F1UjZehvS8JmMCOtfirHVTiFqke+Rv/8egsoyPTlRD6N7gYlD/JfET27dKWuWaPM97PwcSi6OAKZ39qgWLsbs2iOBLGL5h7h/GsAqnIAeLrerMbdasQlc3nhZ+oL01yRo2N+J7zAHMKgSzk4WVDuijB/G50W40kYrzW0n+eOZLfEqSM1dY2ZHtRa+SYBr4FZDdewByBgwUXF4BMpY0WwfiNQ5LqVamyMOxYHWFq9o4KrOtyTdzyNXulEkshg7ctSdTxhGM7FEll3RaOVOqjia3ppzHGr9N6MJ1M=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2020 22:35:43.6052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783c853d-0566-46e9-2322-08d793c1ee98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4596
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F38685EDA46C4B4886DEB759D7DE041C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhlIG1ldGEtYXJtIGxheWVyIGlzIG5vdyBwdWJsaWNseSBhdmFpbGFibGUgYXQNCmh0dHBzOi8v
Z2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLWFybS8NCg0KSXQgaXMgc3Rp
bGwgdW5kZXIgYWN0aXZlIGRldmVsb3BtZW50LCBhbmQgSSBlbmNvdXJhZ2UgZXZlcnlvbmUgd2hv
IHdvdWxkDQpsaWtlIHRvIGNvbnRyaWJ1dGUgdG8gcmVhZA0KaHR0cHM6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtYXJtL3RyZWUvUkVBRE1FLm1kDQoNCg0KQWxzbywg
c29tZSBvZiB0aGUgbGF5ZXJzIGFyZSBub3cgcHJlc2VudCBvbiB0aGUgT3BlbkVtYmVkZGVkIGxh
eWVyDQppbmRleC4gIFNwZWNpZmljYWxseSwNCmh0dHA6Ly9sYXllcnMub3BlbmVtYmVkZGVkLm9y
Zy9sYXllcmluZGV4L2JyYW5jaC9tYXN0ZXIvbGF5ZXIvbWV0YS1hcm0tYnNwLw0KaHR0cDovL2xh
eWVycy5vcGVuZW1iZWRkZWQub3JnL2xheWVyaW5kZXgvYnJhbmNoL21hc3Rlci9sYXllci9tZXRh
LWFybS8NCg0KVGhlIG1ldGEtYXJtLWlvdGEgbGF5ZXIgd2FzIHJlamVjdGVkIGR1ZSB0byBub3Qg
aGF2aW5nIGEgZGlzdHJvDQpkZWZpbml0aW9uIGluIGl0LCBhbmQgZ2VuZXJhbGx5IGJlaW5nIGVt
cHR5LiAgSSB3aWxsIGF0dGVtcHQgdG8gYWRkIGl0DQphZ2FpbiBvbmNlIGNvZGUgaGFzIGJlZW4g
cHVzaGVkIHRvIHRoYXQgbG9jYXRpb24uDQoNCg0KVGhhbmtzLA0KSm9uDQpJTVBPUlRBTlQgTk9U
SUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBj
b25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVs
eSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1
c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBp
biBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=

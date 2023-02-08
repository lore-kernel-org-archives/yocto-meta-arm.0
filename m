Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA88C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 13:32:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.8373.1675863127164365101
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 05:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tk4NqQBs;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZI9T81YIRqK6zIIGOJRianeJoEue1AFGAgyWM1BcUk=;
 b=tk4NqQBsQaoIHzsl+ERpk79vpKWYpD6a+fdIBwQW+Nr9SefVpdH8orLVggtgWdV43es3PJmFy5q+meJu5zec7wmsRm9G5CMocaPruTZjmiTAaZgNKUvzwL9YDFlRdd4iBZ8giogrxTx1GjJ7Ux+K20miSd0phcq14wmdNecwUtI=
Received: from AS9PR05CA0119.eurprd05.prod.outlook.com (2603:10a6:20b:498::11)
 by DU0PR08MB9393.eurprd08.prod.outlook.com (2603:10a6:10:420::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 13:32:03 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:498:cafe::b6) by AS9PR05CA0119.outlook.office365.com
 (2603:10a6:20b:498::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 13:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 13:32:02 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Wed, 08 Feb 2023 13:32:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 277fa06ee135ef3c
X-CR-MTA-TID: 64aa7808
Received: from b786a82a9a3e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9C5B4B3-F362-4126-88AC-32259D41B395.1;
	Wed, 08 Feb 2023 13:31:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b786a82a9a3e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Feb 2023 13:31:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1BpvIjAVcyLgiuTn4mDlUmBm6kgxs/07qzeyeY5P+fAzfERv3PeLRxiUTWqflX036yaqGH6DsmjulWOsAXb6WOmPS9zPWB/QwRUvMrphbHIUBOTH0tppAMBEVAlVP9kR4+OlgIlTvqT+BnI36rpwHAEVeR/4LGnPoR28Vb/pa3p/c+4/LBVq9niDBPzI3SefSJpVorpSPl/9ouscnNCsNuQ8nw3UN2Af4jDh3y6xHLA7PTPQ5rt6xjRjDvgAocK65FI7/2ki5EU+HQHB2dVTYdGlCi+OTnuEI4RXi91SuZ7hlpaTS1MCFYdET9CouYQtU48F5p6qunz2Afsw7or5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZI9T81YIRqK6zIIGOJRianeJoEue1AFGAgyWM1BcUk=;
 b=RZEGJJSi5hFCbtYjtDOBfdn8TzcY8oD73l9qvKCnGHlg3nYc5lYKdltt1hKTEL+dc4F1GAaZPLxYMmdHdm6GYAN7MIPtB/pCnpTxcWiSqpVK3MlmjsJcS3EHx8/0xdV2oSuGG5r2r54cP3cnm//Klps/lgCK5OD9VRIPCRVOnq6pxyVZcmke+P1nl7Du/wOhXWwJ3W9PbvhuKMLBwnFW70mLv09xOAAuCIWieMpTs58gUq0MYwgNkQbEQfDK/CPMmXiGPYMdejd5YYttqYFLlnJfJwGTzrm4H1l2GM55YjisObsZ/U0pT5g9Tj3BrRcjscF3VO3a1SXK+gU8wySFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZI9T81YIRqK6zIIGOJRianeJoEue1AFGAgyWM1BcUk=;
 b=tk4NqQBsQaoIHzsl+ERpk79vpKWYpD6a+fdIBwQW+Nr9SefVpdH8orLVggtgWdV43es3PJmFy5q+meJu5zec7wmsRm9G5CMocaPruTZjmiTAaZgNKUvzwL9YDFlRdd4iBZ8giogrxTx1GjJ7Ux+K20miSd0phcq14wmdNecwUtI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Wed, 8 Feb
 2023 13:31:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 13:31:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peron.clem@gmail.com" <peron.clem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
Thread-Topic: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
Thread-Index: AQHZOwe/VCMt59EJsUe66Cnng0Xota7FDU2A
Date: Wed, 8 Feb 2023 13:31:54 +0000
Message-ID: <485A1B59-6AC8-4439-AB6F-F9CCFA445706@arm.com>
References: <20230207151952.94769-1-peron.clem@gmail.com>
In-Reply-To: <20230207151952.94769-1-peron.clem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6551:EE_|AM7EUR03FT033:EE_|DU0PR08MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6e89e9-749c-4891-341f-08db09d8dcf6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xuWLtl5o6plYV/mjAum9BmMH2HTFA8moQo9N2LH9WWpIEw3VuD6nzTrnx6TjuqQFUMkrrzeNBxvha9veA1ZqUNLR/4tD/v3DD01i0jO5J7YMT6S03IkpJeObkjig2eqsUSFUfMqGcfGnj97laFhSWDq+VgclcsLrvsj4Ag5xJgE6oITzS6Ay2M5RxU8DVa8xnueeyOIf7/vjVbTwXkCMOuwdQHWeu59OCL3v3axp3SYx9AcDU827ewuT113AtQiHM+ud/PV90MXXsXRecPTskhfkbVk3VWW0YPkysyaXH6wIvnBdOW0OcnZNgPE2EV50YLEnJCUKkzImrvWAfD643v/Yo8YfLZJOKcmNz5L+275HMwOb4XS/kyky9oAsXLqdenYp8qbeOjBLuqrY2kFky0CbyzHFgbF2hFp1ltGBjAR0LQNkCfr6oqKuLPaO0yViOjHDXeR14AXMwzg2pG7evGQ14PDH9nxufx/Dkafw5BE0gQXdLofQKFbMGOPeViypdH3ILyKDlrOjV/k5Ga/+Z+m5GniTdqCTEmkH1d+cVVsKbjk6K8p3MTxCB2BLPskMOBWSbtYCJn1j3FM7VjDr/GYePqOb4ZJX/bLcrfjP61ZE2JfvF/zaziLok5U3vk5o6k7lLBquY4cIdMY/BEtT2UxzbQQAyfb1fe3z6Wk736zeLNMothve6O5ExA6sbrRUuzQRtmbqS0+I7lQLVS0nF3rT0RA5xU92YSbiN4JoEmr5pAj+U+RGMH7DgCaygTaK215/L73BaJSWJHRswJZKTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(33656002)(316002)(558084003)(71200400001)(186003)(36756003)(6512007)(26005)(53546011)(6506007)(2616005)(6486002)(966005)(478600001)(8936002)(2906002)(38100700002)(86362001)(38070700005)(5660300002)(66946007)(66556008)(91956017)(76116006)(66476007)(66446008)(41300700001)(122000001)(4326008)(64756008)(6916009)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB94456A42B91D44B366B9D2AC392B18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2300231-2ae2-49bd-fbd9-08db09d8d7ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pka0bUUOxezri6aJbwVa1xV+wWBkK906hlnMcrFUSfMt1N+8sHxInB+EAIdW3konPaaRZWiQT3PhdO5aWKyxkqgcnFf9eilYpDOzS4ACWHhvLtHUwIM8v9FRA/2a3TJmjgXO9G9birgN4rG+l9oKxUzTSvWh+Ec6Q25eTfZrUCHn7ZA7kJNZ4nBJJDIzXsO5zcSgHtFrIUvGpJbHan5LyFaxHfwATND8qBaYtX54kdu8Fc5QR9LS4paTcbVv44uo+bPVJHYOQhzZI5HP9kg5thE/UPwbXqU5VeBbgkQwMZ5gDFVt6sDddBC0QFzmeEfZ4SvGNIGZU/EwIXHYy93bUMhs1WTEJdgwTzYAdmJu3YNcbx+Oct3YJeGt93lhxgp4uCDWUCGF6U5ooSmDMadd67LaQ3csvFbOK9LyuwGBfzooEAdiXXoPhUe6AejuA8/bVsgOoNHbtQ+0biVJLMEn0IhH+WBDcK6tZCMmuJjXuk68B8KPlIE4ojHtsvjrvTGkERQ71QjWQRcmySVPS6g8HP6oaO/M7ub+3FHbyZXPIPvbXLemKm+GTflSiuVos0dHT0KRc9ByKz8Y9pm46tzH9yqDZvLAwD60UBMNtICUbxDZqPgbPgFR5wJlq+h+64KJ1SuLTIDcT3Te3IpeKh6eHaEsZqQ2pjcl8m8ZBkLlgFNkhGhUfhzT98O94HUL0XlGGPOaNXEdoCz2ESCUvsgao66fKvhcHBYRGzI9eY5pG8s=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(40480700001)(316002)(966005)(36860700001)(6486002)(478600001)(47076005)(33656002)(36756003)(336012)(2616005)(40460700003)(356005)(81166007)(186003)(6512007)(4744005)(26005)(6862004)(6506007)(5660300002)(86362001)(53546011)(4326008)(70206006)(70586007)(82310400005)(41300700001)(8676002)(2906002)(8936002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:32:02.7140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6e89e9-749c-4891-341f-08db09d8dcf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9393
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Feb 2023 13:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4371

T24gNyBGZWIgMjAyMywgYXQgMTU6MTksIENsw6ltZW50IFDDqXJvbiB2aWEgbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZyA8cGVyb24uY2xlbT1nbWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
d3JvdGU6DQo+ICtERVBFTkRTID0gImJvb3N0IGxpYm14bWwgcHJvdG9idWYgcHJvdG9idWYtbmF0
aXZlIg0KDQpUaGlzIGRvZXMgbWVhbiB0aGF0IHRoZSBDSSBuZWVkcyB3b3JrIGJlY2F1c2UgbGli
bXhtbCBpcyBpbiBtZXRhLW9lLCBub3Qgb2UtY29yZS4NCg0KRm9yIGV4YW1wbGUsIGh0dHBzOi8v
Z2l0bGFiLmNvbS9qb25tYXNvbjAwL21ldGEtYXJtLy0vam9icy8zNzM1MDEwODc1DQoNClJvc3MN
Cg0K


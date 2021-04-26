Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web12.8070.1619449287526557222
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=28glRbWP;
 spf=pass (domain: arm.com, ip: 40.107.21.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIMICZeuSlM/Ic6eRLwxGFu9kDSFlUCBvFHHpnwYy2s=;
 b=28glRbWPRvD4iP17cBy0oi97+rPM8utYXzC1akYB1tdELaeqms/sUSH/Ahvg3vgeIaoZRTZWhN89A8PrvIqhKSSjiX/AMnY4BfAUw4fQ3eVeUKf4zB7qyMEIrZ7x8iPe7D0RlOyNh3Eo2JuCqMNRBZHMKh35jf5NRx+BjLyHcuU=
Received: from DB8PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:100::22)
 by AM0PR08MB2945.eurprd08.prod.outlook.com (2603:10a6:208:63::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 15:01:24 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::5) by DB8PR06CA0009.outlook.office365.com
 (2603:10a6:10:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 15:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 15:01:24 +0000
Received: ("Tessian outbound 47ca92dabae7:v90"); Mon, 26 Apr 2021 15:01:24 +0000
X-CR-MTA-TID: 64aa7808
Received: from 39798f542ac8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9C3F15BD-0861-48B5-9644-F654F5C77FC5.1;
	Mon, 26 Apr 2021 15:01:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39798f542ac8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Apr 2021 15:01:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwxyaCSVJUeDZiQzQY4cERgczxNXyW8Nen10DskD8BmLOZ0UMsMYPW7ZFZxEMkp7kSFZWcqh/bE/eQXsL5XSUyftnmZx2wni0XQ/Hso2Hia+nM2JLaN500ZmvUJ/6ZUHg89sRdZ/H+13j2vNM1LnjoocMMw/HoycYhdDY8QKfOu8IjmvhLLUUK2//JNXBad8hK0M7DNk7mqWNICBO+rwwmoC1VpqwHkkALmv7Dbetz7qd5V+qzi48fub+MS3c+0Vj3vOGR9c1J3VcR5XD5VBi7Y4ypFdDOs318FCQGwd64FsvOZ4MUxVcC+RlL5dI7iciW3f8QOnnRblYvGF4m9Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIMICZeuSlM/Ic6eRLwxGFu9kDSFlUCBvFHHpnwYy2s=;
 b=Ye0PBAzbXfj/gmlPH0bGJWPXTvl2xXTDcmKnoCX6ngLxT6kAedQBdJqxwrN29bHBA9bnS779wnJqGe9SKsjV+tc94/wg0G12mZ+HWgJRwCmp2Eq2AP/bse49TDzVPGjqXE99E2xkCisNQVgV646+4q2q69LjcmMQyewAv9WKPupte/PRib7uFEH1NvFC38GtdXWw/q8vBpKZ2zqg3W2J0INi/wSI4HeA+sQR3aLE7papvj0G1fl7D7/zGQOLCumOSWKhppmBcFqZYBisZOQClJrRalPwsGklW1LLVbKNWqQdl1mjtON3mD2thnKV14xyKrOQPeNKsu0Q+PxMbCtTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIMICZeuSlM/Ic6eRLwxGFu9kDSFlUCBvFHHpnwYy2s=;
 b=28glRbWPRvD4iP17cBy0oi97+rPM8utYXzC1akYB1tdELaeqms/sUSH/Ahvg3vgeIaoZRTZWhN89A8PrvIqhKSSjiX/AMnY4BfAUw4fQ3eVeUKf4zB7qyMEIrZ7x8iPe7D0RlOyNh3Eo2JuCqMNRBZHMKh35jf5NRx+BjLyHcuU=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 15:01:17 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:01:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "peron.clem@gmail.com" <peron.clem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
Thread-Topic: [meta-arm] [PATCH] [RFC] gator: Add new package
Thread-Index: AQHXOe5cOmrWOSIgTku3T6WH95RH2KrG5GSQ
Date: Mon, 26 Apr 2021 15:01:17 +0000
Message-ID: 
 <AM6PR08MB3461990064C0A43E1F1FFB8692429@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <167925D13277D687.1887@lists.yoctoproject.org>
 <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
In-Reply-To: 
 <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9863272D6FB6A54898233301A0723AD3.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4363619-101e-4436-82c1-08d908c4293d
x-ms-traffictypediagnostic: AS8PR08MB6615:|AM0PR08MB2945:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB2945182DD8D8730BE702190992429@AM0PR08MB2945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SFDBxzyrq27cLoQwCXH6Q3qxKdQAfJtvExKpuVuJxZRPaWlS1bwCOF5OEB0O7mrw9SHWJ/JOVL7bctCWTvjBBWHpMASNRmbN/ufHl2e9fR4gH3vHvBtfrEW5YKxHJscYUu8Agq/kK1Nm3o6/Y2i+Nd1ivR6RMnH48uyTSLXas3hdnVCRlBwiYRxvoo/hTomk07E5CnzD3LiXKsIJgca4/0fbGl2TuxELeeWhNAtSSqLLnbr3xhn3Ow461nwzq5JGfl96coJGR955NWky7qdB7r0BFM4qJwPUeKzspmZ2d3+6FS3GCCeKY36rmbgeBZXbg/JQCGcDQuMft05cHkzsb0B17P9CN68GHijMLejW9d1HSMe/DSnFSEJDI1j63TSJUXHnEPhf62dGxjABeOGlSpBnqudRAiW6/LjE6hpHSSgPpZxYm60nHI4D8+DlW/nvyWZAn6MWINv8rZZ0l5CR77xr381MnDfZQ5JXGLtnjtkEwyHLaXk/qrV1dQVan/IRr80LlgGb8tar86fAK1en43UglpBnJnZVo8Dnq8f61hFb3A4tKaBDOb703AN1ej5ltEcnc/pEKAId89aFsQWfe4MnHTvz8n/TQvN3R+RQQNZIniiTdlxGao/Dw1edi7GsuYy2td1zyVpb8K/aaELZxjVf+tPFEXhTefuSg5ixJL6g6r4LxXWhkBvIO365Z5JM
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(966005)(8936002)(64756008)(8676002)(186003)(6506007)(4326008)(6916009)(66946007)(478600001)(26005)(5660300002)(66556008)(54906003)(66446008)(52536014)(33656002)(86362001)(55016002)(9686003)(66476007)(122000001)(316002)(76116006)(2906002)(38100700002)(7696005)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RXJYSGphTTZ4SkhHalBNaERMNTJwcmdjMFdIem41WUovaWZhT2ZEWkFQVHVS?=
 =?utf-8?B?RWUvemQxME9hTFBZejFoUzJtWUczUkhlVXZmcXdwT3NMRE1xZG4yZlVTTEh0?=
 =?utf-8?B?RmorMXBjZGlDbE9oN3BramJSMXJtWUV1NUd3ejBkczVmK2JJVUJ5NXdvWjFC?=
 =?utf-8?B?SWZpMjEvR2JZdzB0Y2dzWVZ4dWo0MGl4OWVxNTlnTCsvRjY0ZVJuTWw1Wnk4?=
 =?utf-8?B?WFF6eUo0SVp6YWpUeG1vR1lFVndZb1R6NE9hY1NUamFkNzRiWEhsZURXQlIx?=
 =?utf-8?B?RDdZOE5IeUkrZFlZeUlWbE9ZSzFFME91T2FvL0dLSSt0SE5GU3YvMWY5UXdC?=
 =?utf-8?B?TUxmYSt1Qk9DK3Z6UXlacmlhdEpFM3B4TllJWm9GbTBiRW0zY1IrN2ptUlRI?=
 =?utf-8?B?RzdJUzl3blljcHBBK2tQME5DdEJla0hkQUVaRUlvaUZUa2pkRHZ2VkMyTFBX?=
 =?utf-8?B?VVNXQWxrcUZhMGFBOFkvOGV4U0o1OWlLKzRmT2kzc2d5bFdOZ0ZZNE0xd2Z2?=
 =?utf-8?B?c2ZHL1lMUmxPdWZjSWNVdjFUWWh1NzRTVkhNY0xSbVpKY3FoOTJ3TjluQlU3?=
 =?utf-8?B?ajU0MjQzaWl1RDF6bHNvZGoyejNxM3RTNE1KOHYrRWRFRkwzYVE0dDFPZkxo?=
 =?utf-8?B?K1h1RXZMZW1aWkI5MmJkaCtHUU1zN29DeGZVd0svWlY2WHFXeStzUHp5OVha?=
 =?utf-8?B?alNOdVJwTVlNanhienF2QVY4SElMRzNVdjdxcjlwZnVXZEI1WkdKaWUwcHlh?=
 =?utf-8?B?cmhSc2JhOS9jaEpEUURBNGtmaGNibmxYd3RnSWZuRDc4S0syaVFqT2FmYktL?=
 =?utf-8?B?NkwzVTF3bDYwTjM4NkxIUU9WcVY4cWdFRDZUNnR5UFMrcnphK1RBLzZDdjA3?=
 =?utf-8?B?czU5MVV3MVAxWmJVYmJBV0hzR2l2YmhTNklGbEpFaCsrMkY4QThiaEJTUUtn?=
 =?utf-8?B?U3lOSFNVT2hSTU53VVRkYjBnTEQ5VGVpeVhrbGh3b0RuY2J3ZWhrYm05aXpn?=
 =?utf-8?B?Q2NlMjdhY2lKcmt5WjlBbGpVVFlEUDkyTVd0WEZDSHdEYlZQbXVvVnJXZlUv?=
 =?utf-8?B?Z2E2TEs0MERUNnZzUTBxY1ZSS2N2UWZ4U3Y4dmtSVFF3cFJiMVBpSHVFeE1R?=
 =?utf-8?B?eXJrZFQwTlRBdzIyakFpbkVGQnQ2MkxtVjN6RDdPZDVpMG81alNoVlkrQnRt?=
 =?utf-8?B?Y3lCQlFlYUJKZ0lDVkNiLzU2U1NBWXpFbjJMWS9WTGdVM0RVKzJFeXZXcm9L?=
 =?utf-8?B?ZGJlMmd6bXBpU3lhVkFacUhqSm83MUs1N29NWTZGa3NvbGJlOFlSUCtoMW9O?=
 =?utf-8?B?blNTM3dzOTk0RndaNzUzeGNGRVNCODNEd2xPeDNXcnZma3lvdVhmYjlScnAr?=
 =?utf-8?B?VDcwemo2eEFJcGNKMmZxbm5qc0ZXSlBBL0Z1Z04rUld4K2pRcWxwaWVpZjhY?=
 =?utf-8?B?N05xKzNaNWR0Sk9kaXNYS2dSRDl1N2Y3eWpKdXVBSzNCVUpMU0ZkcGltb2h4?=
 =?utf-8?B?R2hjM1plU0wxWmozK3RrYnpjR3VncTVLcFdBQmpZbmJqTFFPRW5neUhiRkZB?=
 =?utf-8?B?VmJ3TGVPamV5SXNNVXd2bXRvdWhVL2RGVlhIMjZVVm5wRU1hdCtRb2dlaGIz?=
 =?utf-8?B?MTkzOUY0L0xPRVFpcmRwYkFjRHlqc0lNbXFob2NTOXl2czJQaVNxM1NwNThB?=
 =?utf-8?B?eGFyemhnZFBKRTdYT3o4d2lrTkN4enhzNlRmZExoaWhWNlJjK3hnUWYxWUFi?=
 =?utf-8?Q?saJCJC1EuJEmuAWV3jO9FZATr7Qp8wYgsiKxMkf?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87fadb36-9c60-4164-f5a9-08d908c424de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LW57Xtty/5xHXlypFYSLG49e5Iil12WmwhRD9lO7JqYSHGeuoJ5at/0QTSGs+TkN6bEPFcquwOx4fJCbkfjDanehdCkupgIENlmfFAC3wGcqdctqoZz/p4LgNsXG+9HzwF7i4O/0PxOxZ0lkSswxeAzDUEADtEV8BUGW8WJ/ErzTYERJfocVRIbFNXqm0WkfuHRaD349lZYMZ4y/EWRSqg3cNl2R7bPC8QEVFLkrFaKR189TJIdi5B6sUTxsCFm48SeFNtMy5udNCXu/zWnmSZfDcne8KlFe3+AP/7m1UUxi2QF3VQkHnx8KjyvbUqD5dWhrrxJsZs13kB/9gVLWcNb+UvsGjikzlbVmlpfmIczUmbjjywW8dCoV74qcRPt6Zi91tLtkZy3FvgxcVuGznocQomj8leRLeoWcve+4gfJmpC5C6MbAPDn/x4g+y4IhBErUZ/cZmar9Nj1wXZDUHaTkfAi8h4AcJVS/OBC9zMNMSr3rw4oaDLhbv3tNhgYSCCt81n1O76TDjNSKK4ccrFdZHBfMOvsYhgTJ6JAxU0AzndLtE8eevppkgblpIWNiLu5EfhyGwtDvfDBJUwotaPdmSMf4ytCDCLCMSWr6X7AB08tUAVihjBOp3C44nsenuWqNZF/uSOmNInSLAw3+/M1RoL6bP9FUYS+l/IhpAjbbMF5vWFcf0bWtwU78e9fOAxv8LLVdNv17hTS3D8OytZ96OZTPkusGCcoTUBEoY5lzCEXiNphOEt3HveVcW15URVKDL3nZFz7xB6GaqNdKlA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(70586007)(52536014)(6862004)(81166007)(336012)(356005)(82740400003)(83380400001)(26005)(4326008)(8676002)(8936002)(6506007)(186003)(70206006)(7696005)(316002)(54906003)(86362001)(33656002)(36860700001)(478600001)(2906002)(47076005)(966005)(55016002)(5660300002)(9686003)(34020700004)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:01:24.8065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4363619-101e-4436-82c1-08d908c4293d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2945
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2xlbWVudCwNCg0KVGhhbmtzIGZvciBzZW5kaW5nIHRoaXMgcGF0Y2guDQoNClBsZWFzZSBm
aW5kIG15IGNvbW1lbnRzIGlubGluZS4NCg0KQ2hlZXJzLA0KLS0NCkRpZWdvIFN1ZWlybw0KDQo+
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPk9uIEJlaGFsZiBP
ZiBDbMOpbWVudCBQw6lyb24gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj5TZW50OiAyNSBB
cHJpbCAyMDIxIDE3OjE2DQo+VG86IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5j
b20+DQo+Q2M6IG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj5TdWJqZWN0OiBSZTog
W21ldGEtYXJtXSBbUEFUQ0hdIFtSRkNdIGdhdG9yOiBBZGQgbmV3IHBhY2thZ2UNCj4NCj5IaSwN
Cj4NCj5PbiBTdW4sIDI1IEFwciAyMDIxIGF0IDE4OjEyLCBDbMOpbWVudCBQw6lyb24gdmlhIGxp
c3RzLnlvY3RvcHJvamVjdC5vcmcNCj48cGVyb24uY2xlbT1nbWFpbC5jb21AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gd3JvdGU6DQo+Pg0KPj4gVG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgdGFyZ2V0
IGRldmljZSwgU3RyZWFtbGluZSByZXF1aXJlcyB0aGUgZ2F0b3INCj4+IGRhZW1vbiwgZ2F0b3Jk
LCB0byBiZSBydW5uaW5nIG9uIHRoZSBkZXZpY2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4NCj4NCj5BcyBzdWdnZXN0ZWQgb24g
bWV0YS1vcGVuZW1iZWRkZWQsIGknbSByZXBvc3RpbmcgdGhpcyBwYXRjaCBoZXJlLg0KPmh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC90b3BpYy84MjMz
MTEzNQ0KPg0KPj4gLS0tDQo+PiAgLi4uL2dhdG9yLzAwMDEtZ2F0b3ItZG9uLXQtc3RyaXAtZGVi
dWcucGF0Y2ggIHwgMjQgKysrKysrKysrKysrKysrKysrKw0KPj4gIC4uLi9yZWNpcGVzLWRldnRv
b2xzL2dhdG9yL2dhdG9yXzcuNS4wLmJiICAgICB8IDIyICsrKysrKysrKysrKysrKysrDQo+PiAg
MiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+PiBtZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2dhdG9yL2dhdG9yLzAwMDEtZ2F0b3ItZG9u
LXQtc3RyaXAtZGVidWcucGF0DQo+PiBjaCAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJtL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3JfNy41LjAuYmINCj4+DQo+PiBkaWZmIC0tZ2l0DQo+
PiBhL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3IvMDAwMS1nYXRvci1kb24t
dC1zdHJpcC1kZWJ1Zy5wDQo+PiBhdGNoDQo+PiBiL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMv
Z2F0b3IvZ2F0b3IvMDAwMS1nYXRvci1kb24tdC1zdHJpcC1kZWJ1Zy5wDQo+PiBhdGNoDQo+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi44ZTU5ZmZmYTFmYzIN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0
b3IvZ2F0b3IvMDAwMS1nYXRvci1kb24tdC1zdHJpcC1kZWINCj4+ICsrKyB1Zy5wYXRjaA0KPj4g
QEAgLTAsMCArMSwyNCBAQA0KPj4gK0Zyb20gMzcwZTljOTdmMWJjMDdhNjNhYTg3ZTk1NDgyM2Mw
MDYzMDU4YWFkNyBNb24gU2VwIDE3DQo+MDA6MDA6MDANCj4+ICsyMDAxDQo+PiArRnJvbTogPT9V
VEYtOD9xP0NsPUMzPUE5bWVudD0yMFA9QzM9QTlyb24/PSA8Y3BlQG91dHNpZ2h0LnRlY2g+DQo+
PiArRGF0ZTogRnJpLCAxNiBBcHIgMjAyMSAxNToyNzoxNiArMDIwMA0KPj4gK1N1YmplY3Q6IFtQ
QVRDSF0gZ2F0b3I6IGRvbid0IHN0cmlwIGRlYnVnDQo+PiArDQoNClVwc3RyZWFtLVN0YXR1cyBh
bmQgU2lnbmVkLW9mZi1ieSB0YWdzIGFyZSBtaXNzaW5nIGluIHRoaXMgcGF0Y2guDQoNCj4+ICst
LS0NCj4+ICsgZGFlbW9uL01ha2VmaWxlIHwgMiAtLQ0KPj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkNCj4+ICsNCj4+ICtkaWZmIC0tZ2l0IGEvZGFlbW9uL01ha2VmaWxlIGIvZGFl
bW9uL01ha2VmaWxlIGluZGV4DQo+PiArYmE1ZjI5Y2ZlYjEwLi42ODA3OTQ4MzEwZjkgMTAwNjQ0
DQo+PiArLS0tIGEvZGFlbW9uL01ha2VmaWxlDQo+PiArKysrIGIvZGFlbW9uL01ha2VmaWxlDQo+
PiArQEAgLTI2LDggKzI2LDYgQEAgaWZlcSAoJChzaGVsbCBleHByIGAkKENYWCkgLWR1bXB2ZXJz
aW9uIHwgY3V0IC1mMSAtZC5gDQo+XD49IDUpLDEpDQo+PiArICAgICAgIENYWEZMQUdTICs9IC1m
bm8tc2l6ZWQtZGVhbGxvY2F0aW9uICBlbmRpZg0KPj4gKw0KPj4gKy0jIC1zIHN0cmlwcyB0aGUg
YmluYXJ5IG9mIGRlYnVnIGluZm8NCj4+ICstTERGTEFHUyAgICAgKz0gLXMNCj4+ICsgTERMSUJT
ICAgICAgKz0gLWxydCAtbG0gLXB0aHJlYWQNCj4+ICsgVEFSR0VUICAgICAgOj0gJChPQkpfRElS
KWdhdG9yZA0KPj4gKyBFU0NBUEVfRVhFICA6PSAkKE9CSl9ESVIpZXNjYXBlL2VzY2FwZQ0KPj4g
Ky0tDQo+PiArMi4yNS4xDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29s
cy9nYXRvci9nYXRvcl83LjUuMC5iYg0KPj4gYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2dh
dG9yL2dhdG9yXzcuNS4wLmJiDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAw
MDAwMDAwMDAwLi44ZTE1YjFjYTVmYzUNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL21ldGEt
YXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3JfNy41LjAuYmINCj4+IEBAIC0wLDAgKzEs
MjIgQEANCj4+ICtTVU1NQVJZID0gIkRTLTUgU3RyZWFtaW5lIEdhdG9yIGRhZW1vbiINCj4+ICtE
RVNDUklQVElPTiA9ICJUYXJnZXQtc2lkZSBkYWVtb24gZ2F0aGVyaW5nIGRhdGEgZm9yIEFSTSBT
dHJlYW1saW5lDQo+UGVyZm9ybWFuY2UgQW5hbHl6ZXIuIg0KPj4gKw0KPj4gK0xJQ0VOU0UgPSAi
R1BMLTIuMC1vbmx5Ig0KPj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiJmaWxlOi8vQ09QWUlORztt
ZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiDQo+PiArTElDRU5TRV9saWJzZW5z
b3JzID0gIkxHUEwtMi4xLW9yLWxhdGVyIg0KPg0KPlRoZSBnYXRvciBnaXRodWIgc3BlY2lmaWVz
IHRoYXQ6DQo+DQo+LSBsaWJzZW5zb3JzIHNvdXJjZSBjb2RlIGluIGRhZW1vbi9saWJzZW5zb3Jz
IGxpY2Vuc2VkIHVuZGVyIExHUEwtMi4xLW9yLWxhdGVyDQo+LSBteG1sIHNvdXJjZSBjb2RlIGlu
IGRhZW1vbi9teG1sIGxpY2Vuc2VkIHVuZGVyIEFQQUNIRS0yLjAgV0lUSCBNaW5pLQ0KPlhNTC1l
eGNlcHRpb24NCj4tIHBlcmZfZXZlbnQuaCBmcm9tIExpbnV4IHVzZXJzcGFjZSBrZXJuZWwgaGVh
ZGVycyBpbiBkYWVtb24vayBsaWNlbnNlZA0KPnVuZGVyIEdQTC0yLjAtb25seSBXSVRIIExpbnV4
LXN5c2NhbGwtbm90ZQ0KPg0KPkknbSBub3Qgc3VyZSBob3cgdG8gcHJvcGVybHkgZGVzY3JpYmUg
dGhhdCBpbiB0aGUgcmVjaXBlLg0KPg0KPlJlZ2FyZHMsDQo+Q2xlbWVudA0KPg0KPg0KPj4gKw0K
Pj4gK1NSQ1JFViA9ICI2MDg4ZDM1MzMxNDZkN2I3Yzk3MDBiOGUzOTYyOTIwNTMyNDBiMjVmIg0K
DQpUaGVyZSBpcyBhIG1vcmUgcmVjZW50IHZlcnNpb24gKDcuNi4wKSByZWxlYXNlZCAxMCBkYXlz
IGFnby4gQ2FuIHlvdSBwbGVhc2UNCnNlbmQgdGhlIHJlY2lwZSBmb3IgdGhpcyBuZXdlciB2ZXJz
aW9uIGluc3RlYWQ/DQoNCkFsc28sIGFzIGRvY3VtZW50ZWQgaW4gdGhlIFJFQURNRS5tZCwgdGhl
cmUgYXJlIGNvdXBsZSBvZiBrZXJuZWwgY29uZmlncw0KcmVxdWlyZWQgZm9yIGdhdG9yLiBDYW4g
eW91IG1lbnRpb24gaW4gdGhlIHJlY2lwZSB0aGUgbmVlZCBvZiB0aGUga2VybmVsIGNvbmZpZ3MN
CmFuZCBwb2ludCB0byB0aGUgaHR0cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9nYXRvciNr
ZXJuZWwtY29uZmlndXJhdGlvbiBsaW5rPw0KDQoNCj4+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vQVJNLQ0KPnNvZnR3YXJlL2dhdG9yLmdpdDtwcm90b2NvbD1odHRwO2JyYW5jaD1tYXN0
ZXIgXA0KPj4gKyAgICAgICAgICBmaWxlOi8vMDAwMS1nYXRvci1kb24tdC1zdHJpcC1kZWJ1Zy5w
YXRjaDtwYXRjaGRpcj0uLiBcDQo+PiArICAgICAgICAgIg0KPj4gKw0KPj4gK1MgPSAiJHtXT1JL
RElSfS9naXQvZGFlbW9uIg0KPj4gKw0KPj4gK0VYVFJBX09FTUFLRSA9ICInQ0ZMQUdTPSR7Q0ZM
QUdTfSAke1RBUkdFVF9DQ19BUkNIfSAtDQo+RF9ERUZBVUxUX1NPVVJDRSAtREVUQ0RJUj1cIiR7
c3lzY29uZmRpcn1cIicgXA0KPj4gKyAgICAnTERGTEFHUz0ke0xERkxBR1N9ICR7VEFSR0VUX0ND
X0FSQ0h9Jw0KPidDUk9TU19DT01QSUxFPSR7VEFSR0VUX1BSRUZJWH0nIFwNCj4+ICsgICAgJ0NY
WEZMQUdTPSR7Q1hYRkxBR1N9ICR7VEFSR0VUX0NDX0FSQ0h9IC1mbm8tcnR0aScgQ0M9JyR7Q0N9
Jw0KPkNYWD0nJHtDWFh9JyINCj4+ICsNCj4+ICtkb19pbnN0YWxsKCkgew0KPj4gKyAgICAgICBp
bnN0YWxsIC1kICR7RH0ke3NiaW5kaXJ9DQo+PiArICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9
L2dhdG9yZCAke0R9JHtzYmluZGlyfS9nYXRvcmQgfQ0KPj4gLS0NCj4+IDIuMjUuMQ0KPj4NCj4+
DQo+Pg0KPj4NCg==

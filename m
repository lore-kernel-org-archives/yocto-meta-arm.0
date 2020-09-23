Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web11.1247.1600881942060253691
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 10:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RishIb69;
 spf=pass (domain: arm.com, ip: 40.107.22.61, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2gW1TBXVFvW5JQ34ktOhQJVzUaAWmvBeOyhg071MHs=;
 b=RishIb697LGv5xs5k3h1NPXwJtOs9ffOFf3hrpe744lK8IcpYCt2U0yUCseb4mBRRws7hwHxOCazxcrnc7G7Gwjo6VIuT+ENF7p4elyP8cRhpH67+X0C26yFoNs5pOOMbivYVjeciZgXrb4avyJobSSkZrYQJ5/zAuvBHv9W4e0=
Received: from AM6PR0502CA0044.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::21) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 17:25:39 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::35) by AM6PR0502CA0044.outlook.office365.com
 (2603:10a6:20b:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 17:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 17:25:38 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Wed, 23 Sep 2020 17:25:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b901f91ed071f5e
X-CR-MTA-TID: 64aa7808
Received: from c9e4154e020e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD315896-3C52-4E62-BA07-1AA70AEB7EA5.1;
	Wed, 23 Sep 2020 17:25:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9e4154e020e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Sep 2020 17:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDX8nrv23yPKYG7Mk2LhjJ1XQwLBy79CakgFNt/+EqptkTepRBPmK/gvtqXiNuJF3lk9x1CAo1xrR774OOYz4rSpdb90+pFEl8lEHX3oINAoB8eV+eOjXmMx2q/zKXLko6tDX62wSfllB4U9ABuMyPFj/vWAzsD/26S38SHR05v+4L26CngxoT2WmY31TJN/RZ3VmJlAAg7ZbqH0vwMcj+MkHd1uUvYPjpKubgI5GF7Vi555jfFUAi0/pR3oXuyeNFU7gakZPSK6n/TVYhw0XsezScfaRHD9l99A9p+jpphlensxkFbkrurjwO30BkgoUmzJcxsxKAQ8V00eVAglwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2gW1TBXVFvW5JQ34ktOhQJVzUaAWmvBeOyhg071MHs=;
 b=WdqOL7Nht5LmaOTi7nfyA8cpDUaGEJ2h5dT0xxzXfcYaMets6mVN7Hskuzwz2g7Jdf6aHWMOy7I+aG74uubLqzavkQzDfqv7fo+q8w9hR3mIrF2ppV3LrMl0rj6bL9/fedWyKCnTncjZJ7Aw9CXUmhxGbA1Erj7gO1RCvlHXh77Qj9Vn/oRfUmKGUFiHQ9pMRjIPwijq6WBsTsWM8GfvMoFqnQYnrRSjtmKs4plLPUdbxDjoNnz8Wp1YBtI7McQFihF0eB0j9AZmqAhcAKud9BsC91GNXxB15/VQ3cY6wGXHQHwJ6OhocwZDs7XyXPcBLedvZmX/A5UwUsleXtM1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2gW1TBXVFvW5JQ34ktOhQJVzUaAWmvBeOyhg071MHs=;
 b=RishIb697LGv5xs5k3h1NPXwJtOs9ffOFf3hrpe744lK8IcpYCt2U0yUCseb4mBRRws7hwHxOCazxcrnc7G7Gwjo6VIuT+ENF7p4elyP8cRhpH67+X0C26yFoNs5pOOMbivYVjeciZgXrb4avyJobSSkZrYQJ5/zAuvBHv9W4e0=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR0802MB2204.eurprd08.prod.outlook.com (2603:10a6:3:c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26; Wed, 23 Sep
 2020 17:25:31 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 17:25:31 +0000
Cc: nd@arm.com
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
From: "Jon Mason" <jon.mason@arm.com>
Subject: meta-arm gatesgarth release
Message-ID: <711c37f3-7ab6-f0ff-d339-62418a0b05a4@arm.com>
Date: Wed, 23 Sep 2020 13:25:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
X-ClientProxiedBy: MN2PR16CA0037.namprd16.prod.outlook.com
 (2603:10b6:208:234::6) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.25] (136.56.1.171) by MN2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:208:234::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Wed, 23 Sep 2020 17:25:30 +0000
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb9dcdc6-9116-4059-646f-08d85fe5b09a
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2204:|HE1PR0801MB2124:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB2124C10E351704377182BF43F0380@HE1PR0801MB2124.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 642faoKbuvoYFr1JlQDdqWkoT8iSsqAb/OizzVYxl7luLaArUrU+oOcOeZ1bX15XeSZxvaBkPMVV04Y2u7Io9CjoY6lP9lmNf5iojbvl4f0huNzHpbw+bSCJ1cYG6m4GDZKCNOWlyWljmgLXrUB/9CWQwPc/n6dZsqpXAQn8TwBLggiWOw+uo5/NVr3kQChi2UHUjHZIVaQJ59s8k6zgKCWimqXezVh99LvmdqD27bOEv81Q6/VAlmwXe8AzVJpxAzA6WLeT7HbK1FVaCZNohg9aRwOvWxXlKMFLMuD7Rhrmo+woyKZgzJq5K9NyZ/dKyYMDrKbqMvxohwGix8RzOMpymzE8JW79W6mbM1Hs3fMcYnrqFiqHuPXib7V9sSRgNj5CoOSaAq/QEWoOY1jCZLtjJlORW+CSRARfMLJBQqNl+kDV/ic4QxsGLLk4ArHw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(86362001)(31686004)(36756003)(2616005)(956004)(16526019)(186003)(4326008)(5660300002)(26005)(478600001)(16576012)(6486002)(83380400001)(3480700007)(2906002)(8676002)(4744005)(6666004)(316002)(66946007)(66476007)(52116002)(31696002)(8936002)(66556008)(6916009)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Arq4YAYcND/+T/F3G0FmCXX4Ux5D/wClICsxrmEGVNKaNu1cuX6aaTlRXB3L5FiFmGrA9i8C1v6v/LTfqObWN9jc3IssWdzwCryxF7z5fRVylyThBxyTshYZip+6s98Q4qZhHdrwt914lAMQLma8wUAidYdVbogE54Zh1bRyGC5DfbsI5K2Ok6uXPQ6H6p7IUjEMEsLJ9XbqDxWctELcbMoFDAOncCXVA1zPSoRpRG4CanlpndkrlDkD2HA5zkCep3yM/FpiyJjqEeQqcsmIm+lDZ/MQE+fDXuV39xagXczD0UAAbznLw7n2WBD97u1O/o+Xo678hSxPImy8jLC4trW5PPVC64ltrOCw9VA6I1t2K1rKeydXqflXxPkw+eV7CiKNVXmbIbYJHGEreEyo4aI8Q8Z0CMyOzd6WwDsVTIeWwt4K1KPaeNR+4vezWR5M44YvBYmDpWOXz9CrYjWUr4Aux3NoAs20+nM/NwWwgyecM7m5FiyjP8/YiBuEOHBC270kQr8D7ncWb8zi1w/Wz3s9qxks2xKuyC/RHjx/aLZryeXcAWFAngQh/uHWNIG1fsVdbCkGAR+6os17cexnavirWnmEeL7R7MMa9C+KYujz67TgKwbNCn/LmYVqI5L7rByfC9cA+aFxPui9tbeBoQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2204
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7acb90e-b30a-4208-ce51-08d85fe5abb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ibmVEm/i+zqgO3xb2iBzT9wtvuJ2hy6DyQ9SDd2LKv5vQM/nevFHf7fN0s+st5Gcebm//jNNm3RAw2OsisFA86y3T/IwrDWnY5UV+uWUiswnGx6Y9q+4/1h6nEjMK8blwV9sL+T5qCJaSnwwCu8Y9r5IHS9OnysM8Hpz3dXVOFf+tIdAuG9SlcRwWlb1vT5I71RmvK/ViATIFskdDQCqBFQvfczDT/guV2i7BxgOI7gRu8Tg6qmAG94Kin67eYSyDF7HArr5biKLqpq3n02RFDv0n54UFvnGhVEBtrkb2utBDVt4+yP4paSm9HaEWkFruk6gdAcq5zjQ2oxptucivfjYn+U+Pe0UZVnYmuXHi/lEZy3DD+lcg31Th3Zsm6NeDCvvonZRSWY8eCyZOGA5RXZD433HJE25up5YbdsNUU/FOdzeyZBqwDo9erCa7fRNblGHM0xq7hLpcxuavhrcVVQQgfuBtqbzkYj0d/xADs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(2616005)(8936002)(31686004)(5660300002)(83380400001)(4744005)(6916009)(81166007)(6486002)(82310400003)(36756003)(82740400003)(2906002)(36906005)(956004)(70206006)(478600001)(186003)(8676002)(26005)(70586007)(356005)(3480700007)(16576012)(47076004)(6666004)(31696002)(86362001)(336012)(16526019)(4326008)(316002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 17:25:38.6843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9dcdc6-9116-4059-646f-08d85fe5b09a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2124
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yocto Project will be making the Gatesgarth release in October, and 
meta-arm will be making a release to coincide with it.  To facilitate 
this release, we are requesting that:
* All outstanding features be pushed within the next 1-2 weeks
* All bugs be addressed in the next 2-4 weeks

Barring an issue or something on the mailing list that is in the process 
of being integrated, we will cut the meta-arm gatesgarth release as 
closely as possible to the YP release date.

When cutting the gatesgarth release, we will be
1. Removing dunfell support from the master branch (dunfell branch will 
still exist and be supported)
2. Create a new branch named gatesgarth based on the master branch

If there are questions or comments, please feel free to respond to this 
thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

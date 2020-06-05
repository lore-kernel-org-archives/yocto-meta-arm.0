Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.87])
 by mx.groups.io with SMTP id smtpd.web11.1535.1591382289215668849
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 11:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=u9qzpanK;
 spf=pass (domain: arm.com, ip: 40.107.15.87, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOTrtRAIW5j6GRlIxnLrf/fU5s7w/OsdHNNFtwvLHpI=;
 b=u9qzpanKt04dbpbdlf+0Uq5qjdcUd2X2gm+Z8GIYgoxxH0hg1QjX2nfeGEqbskJzEYMQy23yvyxGemLagF+qM9Qh0FwbFm3n+andlmS9sKI3up1HksrJMyTrfJhkjMFRkrJk9fK/apVUbWCMjMfYm0wYV0ipX5bv+GbCCWBgSjo=
Received: from AM6P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::30)
 by DB8PR08MB4972.eurprd08.prod.outlook.com (2603:10a6:10:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 18:38:07 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::a2) by AM6P191CA0053.outlook.office365.com
 (2603:10a6:209:7f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Fri, 5 Jun 2020 18:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 18:38:06 +0000
Received: ("Tessian outbound 3e82c366635e:v59"); Fri, 05 Jun 2020 18:38:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b239df24c1526613
X-CR-MTA-TID: 64aa7808
Received: from 5fef1cdd51f1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D606EF7D-CA76-43DF-9630-4A253F56AC2D.1;
	Fri, 05 Jun 2020 18:38:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fef1cdd51f1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 Jun 2020 18:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYtoLPwDBz9Z8uwYxcDgr8mwAX4eeOK8rmwT8w5f686FoAYy2yWNRw/Xo97KenGRPk9kS/R1Cce+SZihSrWc5+Wz7/d/5PMvZTP1hhRad1GZiNuy16kwsHe5gYqsMp2lNuO9vGV7vxTZyASkGQZGl6jS9Em0eJXwwOQws8obGU7xsoVKvdCeXeLi7J91sU0ExMrhbr4lavV4pOtfdEG7Of9KFVKA0jenXo0uw3Hv0A6xmehqK2WgCIKx808QNSyrkgwblzYO3JJRAQq+rKuboU2PNj6FQ94gpajnfRLamfMU8kUeKYsLXvmqSMxZBYVHivyqgrWcYyuYXwj0SYlaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOTrtRAIW5j6GRlIxnLrf/fU5s7w/OsdHNNFtwvLHpI=;
 b=CkRlCfY6Wca2NnTDmoUZ9IIlC9Q+am5sSmUoDo1Plkf3jmfE1WcXKNOWPiRHzlRXUo1g6jI21wop8btD4xoaf9wZ2aciYSDzB7hwSzA9KPrO6arHtuW/+FEtYW46dU2fj9Uuh1bbUFistg7NWNiLUg0xxE7pc2hLN4i7PY2N/3IAFmtJ8aFzmP2+8329VQNgmdu1/SyFnkU+81wUPyxR8+aC+PNal2KBY+G5vvOjERk2V9RLnjH5Y04gnhtxBo1C1dYqirApJrkZLDjMRozJyXlIK+fmQyQ2xdrhhE8eMpesGmlaUaDsagAUhoP3ReQ5iIoBO9nv089eAKrTuDq7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOTrtRAIW5j6GRlIxnLrf/fU5s7w/OsdHNNFtwvLHpI=;
 b=u9qzpanKt04dbpbdlf+0Uq5qjdcUd2X2gm+Z8GIYgoxxH0hg1QjX2nfeGEqbskJzEYMQy23yvyxGemLagF+qM9Qh0FwbFm3n+andlmS9sKI3up1HksrJMyTrfJhkjMFRkrJk9fK/apVUbWCMjMfYm0wYV0ipX5bv+GbCCWBgSjo=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB4962.eurprd08.prod.outlook.com (2603:10a6:208:15a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 18:37:58 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 18:37:58 +0000
CC: nd@arm.com
To: meta-arm@lists.yoctoproject.org
From: "Jon Mason" <jon.mason@arm.com>
Subject: Proposal for the branching policy of meta-arm
Message-ID: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
Date: Fri, 5 Jun 2020 14:37:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a601:a664:2e00:3093:244e:4f56:1c51] (2605:a601:a664:2e00:3093:244e:4f56:1c51) by MN2PR22CA0023.namprd22.prod.outlook.com (2603:10b6:208:238::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 18:37:58 +0000
X-Originating-IP: [2605:a601:a664:2e00:3093:244e:4f56:1c51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7a86c40-9553-431f-5f96-08d8097f96b9
X-MS-TrafficTypeDiagnostic: AM0PR08MB4962:|DB8PR08MB4972:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4972724931A581B5C3749D8DF0860@DB8PR08MB4972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: f4TzlAaX+fL5rAjIOcKBiiHhKQZ0lVik5zuecsXm8EXwEyrXGsNs82bLupT2ShkIgPzPsYkVSA9LLyJPldWiii29GXoFqWZub0KEIm0Fo5axrZj5oY3pE2AwY05UpXZOAgfXilIkRz6fSiB9i9VFJmUgicgPiBV0h3RlHxXdl2qXzJxSyMWO2CCqDTR3GkyQvvEYh5XeKgp7daIns6V+tYZMMpZwUMKbGg8Z6p+qbPcphrBk/mp8+hERMWyPahRDQ8hnTeAEKzjkS3ssEOkDgJPQRbvLHN9n6VT/IKAi4e1HiO0yR7XQs9DO/8ovEC1+/ORDWmJgcVTwAUBIE/i4lO1wPE0aV31nTFHpJUK3XLarweVJxV9tZD9A3Z2hfzFj
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(186003)(6666004)(316002)(8936002)(36756003)(2616005)(44832011)(478600001)(52116002)(6486002)(31686004)(8676002)(83380400001)(4326008)(16526019)(31696002)(66556008)(86362001)(66946007)(66476007)(2906002)(5660300002)(6916009)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: q7IKvDFLuUE/vrMA0FHZ39/jKuV7jkvMLQd2GYl7hgaUiyCwurOixajEy32YBEs2aGbIcAMTFlLVO6LYfj6hNXpPgoPo/T6Iui2NtmzpoAeLUOJKh4x5C6pHK8VPx6ujieTI7Bedu5TzRYJZbWtNbQASrSgt4D58MHqN6kxcKZ/Za6LemA5Xd3idDP3XOk+VS+1z6wD7EAAoSbgn/OPaIWQYf0e/7dTOCg1BXQbUmGMDMdCqn9MaCDrZcuJj4DX5eVtBy0MURERFWWmQNcAZFhzJK+31j4cw0cDr9bRnoXuXTBXOblgEaiKH57A8J6xvaCojG0zravMnnOT+yFYJVtbK/E9WZBuZ4TjzpbkV+3eDJgXWI6LaADF5//tp56vYPMX1Rgl9he/yPswKKLjeSWqzBdrWy6Jy/Mpb6wLxQuGF526qc8pacakJ7rM/wR6a5O0unicB151YgfnQKq9+UlRXZqcV4IFfTo0pHnl9Z7k4jac9gNMLstzHEvu66uLZY6339mb9OE5rYf3KFg9BUNGIqYbfjJMwQtK2HOxZ9+8xfALQyDf5KPdCg3ZRheep
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4962
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(47076004)(8936002)(316002)(82740400003)(26005)(36756003)(4326008)(6486002)(81166007)(478600001)(83380400001)(8676002)(6916009)(82310400002)(2906002)(44832011)(356005)(31696002)(16526019)(6666004)(31686004)(36906005)(5660300002)(2616005)(186003)(336012)(86362001)(70206006)(70586007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0323b293-0097-45bf-add0-08d8097f91cd
X-Forefront-PRVS: 0425A67DEF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W9j/LLVGPUM1WW7lGK1vPMIgq7ubWrOXJTlLucyzLwTg+OgAsbYQLfr4c45fqvjuKixwkcxb5eMWl93ZfuvCMBus60T1S35ROkY3vphXFxBoSsJ6mLeD47WvuYNGMD1mO5vFHjxHBhcFSzWjJNkzt4hL5wdKmYDg2YK1/4oiKNU6201E6jsc66XvbG5fR6TH9L7U2kcjc9suyMmnEXAQYTsEMHVwhaTNbMieslCHiMBLJC2Zz08ist+cN+z+t6hz0Rp7dFXC2j592oimAk4m3jxwKFF8hlBmrCsOJTyIf8NJ0mGl8UcrW+10uKVyzS9w111Hs+cpPGYYC5uPBI3C4CmpN0+X1J5aQ6KR8SL6593rjUY2gQUEDIw0W6PTp/BLmv33oef6Ii9f0ThFZ3lGRFzuowuhOLOlbQ8ciwuHyN5AiAXKCC5JIQ7DpCcIfrMl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 18:38:06.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a86c40-9553-431f-5f96-08d8097f96b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4972
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Problem

The Yocto Project releases twice a year (April and October): "stable"=20
releases are made every six months and have a lifetime of seven months=20
to allow for migration, while "long term support" (LTS) releases are=20
picked every two years starting from Dunfell in April 2020. The standard=20
practice for all Yocto Compatible layers is to create a "named" branch=20
consistent with the code name of that release.=C2=A0=C2=A0 For example, the=
=20
=E2=80=9Cdunfell=E2=80=9D release of Yocto will have a branch named =E2=80=
=9Cdunfell=E2=80=9D in the=20
official git repository, and layers compatible with dunfell will have a=20
branch named =E2=80=9Cdunfell=E2=80=9D.=C2=A0 Thus, a customer can easily o=
rganise a=20
collection of appropriate layers to make a product.

In Yocto, these named branches are =E2=80=9Cstable=E2=80=9D, and only take =
bug fixes or=20
security-critical upgrades.=C2=A0 Active development occurs on the master=20
branch.=C2=A0 However, this methodology can be problematic if mimicked with=
=20
the compatible layers.=C2=A0 Companies or open source projects may not wish=
=20
to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D branches und=
er active=20
development, due to the amount of testing, fixing, and hardening=20
necessary to make a product from a non-stable release.=C2=A0 Also, changes =
to=20
keep the master branch of a layer working with the upstream master=20
branch of Yocto may result in that branch no longer being compatible=20
with named branches (e.g., it might not be possible to mix and match=20
master and dunfell).=C2=A0 So, a decision must be made on the branching=20
policy of meta-arm.


Proposal

There are many different ways to resolve this issue.=C2=A0 After some=20
discussion, the best solution for us is to allow new features and=20
hardware enablement to be included in named branches (not just bug=20
fixes).=C2=A0 This will allow for a more stable software platform for=20
software to be developed, tested, and released.=C2=A0 Also, the single bran=
ch=20
allows for focused testing (limiting the amount of resources needed for=20
CI/CD), lessens/eliminates code diverging on various branches, and=20
lessens confusion on which branch to use. The risk of making this choice=20
is a potentially non-stable branch which will require more frequent=20
testing to lessen the risk, and not following the =E2=80=9Cstable=E2=80=9D =
methodology=20
of the core Yocto layers (though it is not uncommon for BSP layers to=20
behave as we are recommending).


Process

The process for patches intended on being integrated into only the=20
master branch is the normal process of pushing to meta-arm mailing list=20
for community review, approval and integration into upstream meta-arm=20
master branch.=C2=A0 For patches intended on being included in a named bran=
ch=20
are also the normal internal process of pushing to mailing list for=20
community review, approval and integration into meta-arm named branch.=C2=
=A0=20
However, any patches intended on being included on a named branch must=20
also be sent for inclusion in the master branch in a timely fashion (no=20
more than 1 week after inclusion into the named branch).


Branching strategy

Named branches for meta-arm will be released as close as possible to the=20
release of the YP LTS release.=C2=A0 Meta-arm named branches will be create=
d=20
from the meta-arm master branch.

To minimize the additional work of maintaining multiple branches it is=20
assumed that there will only be two active branches at any given time:=20
master and the most recent Long Term Stable (LTS) as the named branch.=C2=
=A0=20
All previous named will be EOLed when a new LTS has been released.=C2=A0=C2=
=A0 Any=20
branches that are EOLed will still exist in the meta-arm, but patches=20
will not be accepted.


Branch transitions

When an upcoming YP LTS is approaching release, meta-arm will attempt to=20
stabilize master so that the releases can coincide.

T-6 weeks - Email is sent to meta-arm mailing list notifying of upcoming=20
code freeze of features to meta-arm

T-4 weeks - Code freeze to meta-arm.=C2=A0 Only bug fixes are taken at this=
=20
point.

T-0 - All bugs are fixed and layer is stable, new named branch is=20
created based on master and no new patches accepted to any previous=20
named branches.=C2=A0 Master branch will start accepting patches again.


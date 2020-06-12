Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.48])
 by mx.groups.io with SMTP id smtpd.web10.19602.1591968233264380059
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 06:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gWpybXkN;
 spf=pass (domain: arm.com, ip: 40.107.6.48, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RVRLafzq3PvLAkXPLtueq800dyPesUXqQmNS0yXjig=;
 b=gWpybXkNHWtA+pPzJm2TLqEjHQlYUOT5v6qwlRPUyRxci1INnQ9290s/UDrmmlh/krwuqOcMmzdZLalKiKvgpOfxu6rXHrDHEprltZJTGBM18mufm4tyCOcTUOgtKhJtDkHLr9onhoJRD7guKLFpGke+WqsHYW842JtX1wo9avg=
Received: from AM6P195CA0079.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::20)
 by AM6PR08MB2999.eurprd08.prod.outlook.com (2603:10a6:209:44::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 13:23:46 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::3f) by AM6P195CA0079.outlook.office365.com
 (2603:10a6:209:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Fri, 12 Jun 2020 13:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 13:23:46 +0000
Received: ("Tessian outbound 1145f7a293ca:v59"); Fri, 12 Jun 2020 13:23:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e0c652313d7b650
X-CR-MTA-TID: 64aa7808
Received: from fc4814c6775b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 79013BC3-164F-49B2-BD74-CC0A0B0D7634.1;
	Fri, 12 Jun 2020 13:23:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc4814c6775b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 12 Jun 2020 13:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPExY80hH8gKNuocLIMUeywfmpPeCP1BoCC1EejnjVMYz3rp0ckv+ddN5d3BG7mD7NIAvS0VYCTVFuG6cpucTdVdawDeOHXU6g5j7zp4YfKtMroBokiwk0ylQWZr1Ucs7TznbjHSgPmk7qLSR3zQQGdByYTkvGJHtNSqdvNAQauv80pnGahT0JUGkTu76R2L6yoY0p9th2P1YF++RExPW2XoofuBbpzXgKMnOlL79WR4CdEB0GiVGEj6cnj+Fog+O0zV6/G3F7JX5ysecRfw0LfF40v9KkoWP2lif5bD39vnhBSmhqXxY0++U0U3sRkhxhwlihoFk95jx43Um3YmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RVRLafzq3PvLAkXPLtueq800dyPesUXqQmNS0yXjig=;
 b=jMAerf6dQ1AUJJeRG3x7tfF039vvIRGak53r82Uf6RVmwrAWkNRNVBtFpZjArjh6MWf8lRBMLzz36woFCfDF8vTFVfMhAm2PVpIMamFi/o+kQFynqu2VBD7DERZAYM6X663h/9lQMqjJ/ryL796dmsNeHuJxo3QBNky+p48v+/HSYH6gqOz+JYjQtm1ld0oEDlpBSvhbNEac0mPIKUpv9Z6QdrMmZcbWR8fmQ7kYJuFS/ciYBHL8TlUD2ou6PkfbnchZaAs9IJznBhbIsUnzpHAhnsPkGDHaXYISME7MJzTowK8HjH2ZPgIkNS24AfuDJe7OfvfUMAoqsbjBEAuwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RVRLafzq3PvLAkXPLtueq800dyPesUXqQmNS0yXjig=;
 b=gWpybXkNHWtA+pPzJm2TLqEjHQlYUOT5v6qwlRPUyRxci1INnQ9290s/UDrmmlh/krwuqOcMmzdZLalKiKvgpOfxu6rXHrDHEprltZJTGBM18mufm4tyCOcTUOgtKhJtDkHLr9onhoJRD7guKLFpGke+WqsHYW842JtX1wo9avg=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3012.eurprd08.prod.outlook.com (2603:10a6:208:5b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Fri, 12 Jun
 2020 13:23:38 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 13:23:38 +0000
Subject: Proposal for the branching policy of meta-arm v2
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
From: "Jon Mason" <jon.mason@arm.com>
Message-ID: <e69728e6-0be1-aa03-bea6-fa57333b2a0c@arm.com>
Date: Fri, 12 Jun 2020 09:23:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26)
 To AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:a601:a61a:4700:d487:8053:cdd4:dbb0] (2605:a601:a61a:4700:d487:8053:cdd4:dbb0) by MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Fri, 12 Jun 2020 13:23:38 +0000
X-Originating-IP: [2605:a601:a61a:4700:d487:8053:cdd4:dbb0]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c14ba909-8439-4170-601f-08d80ed3d629
X-MS-TrafficTypeDiagnostic: AM0PR08MB3012:|AM6PR08MB2999:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB29998B33275EC9678C283076F0810@AM6PR08MB2999.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: eY82nm3v7r3V+aBpTKgIj58UseqvXeUuy6ED83+GxOccA54kPfcmjLQXN0PtB6EtNWhAYB7P0JQLNjVGcPYNu0V6bgfeAkYMqP1Y3284tNK8kv5yy2yMTOMBZgoJrqoIAVolkBihlMvfuEx7tUYBTqzDNOHyFAgh0MSpJdQzXTrxbuatDkv7FVStuZv3hDheG+0ktgJ5oyJ7+EvxHlBEURGPApCjEECIPZtZkjuyeZHzIb4XIDlMBpQgBX/oa/CclmzuigDJqTfq8qt/PfaA7GL+XN/SigLrBfUmbf83YD0AxYs0SP4EEq4nNZMxoPR4GFIbGPqpOS3MGu45yKpmr80DEFny1sVRY/wSaApgp29XEuHWl9PsDGBuu/HU3rJw
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(2906002)(8936002)(66476007)(66556008)(66946007)(2616005)(5660300002)(52116002)(6486002)(316002)(83380400001)(86362001)(4326008)(8676002)(16526019)(6916009)(36756003)(6666004)(31696002)(31686004)(186003)(44832011)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VJ4+Ch27tFCgalajwZ7Vi64fQBPZ9xZXatynCN/7YoVhWfsw4b1g6qmVVoTcvQPSzuj9TUUCflxyaAzycCifE7RVp/x6J2tr8Sfylrk6fm5ptoIZJYFw0+D8ubdEa96numZ0BHF1imvKLgE195vYY2U6qypDHVr/2o6ZsCVlh9nH5erZp4pNJn2g5pTe1kawsxtLVCkeL54mJuXAqDH/c7eiP5NkDmQf9FWfldxm11BQVWbBUlfocSFXrwY5vJnx6w1lICmRhBE+TGa1AvdwxL3Y34Aw7noaIlfvL66GMciFk5u4A2UCfohK0NACk+A+sMTMrxkAuc1B538m4XltlU7plIsKOXvscOrGHzJOQdo+jIl/5APXaXz1OtN7qKd0yHJXRQf+G4J6lC5MGP9eyirBFxOVRVFscLhlMRGBsfnP5BKELSB4ocq6x8LfNMhz61d21/wrYJwC28lk85orUWNnMsxHSMrDvD7T5THPwrtz5yeVDZYJniAXRB+IfEfzjbHrsXyjRaO5F8GKKKnrOAPEdX2EORaQ3LKXT1AdgB0lKb2OEosGy1zx9fKwnBmx
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3012
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(86362001)(2616005)(6916009)(336012)(4326008)(16526019)(8676002)(31686004)(26005)(186003)(8936002)(44832011)(5660300002)(70586007)(70206006)(478600001)(36756003)(6666004)(2906002)(47076004)(31696002)(356005)(82310400002)(36906005)(81166007)(82740400003)(83380400001)(316002)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	46d3d061-e88d-4d65-6f0b-08d80ed3d15a
X-Forefront-PRVS: 0432A04947
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	az0PcMHO54ZNnX9PVdk4lsNRFgIqSnFL5aZ9l0Z6YjBMJ8U77IhT3YaP8eYucY0eTIFfniRqdNkC/UG6ti3KrdfcPQAr7RlrrBzf7mRomMxjTF2UKTmyaSQ1m92zmEOr5aRZDIe77zF1VAypJuwWL8Z1uAG0BJz8LALl8A/dT8am7d187ilzkb3nKY518Gth3WNg2E5qO3wb9SdYj8vtwHspQDlxE72AxqXiU2Rz2suDYSviV4P+fDtKpwH8rXKUOEtaiRb4YVJr2viK2BYXOQDwZTuZTTbtx2r8SjNNijTD0Hubf38hFBb0hOesfVZgQ2SKneSoJb8ObNOGFgKyo/tSo2MBlpp4bVIn4KG43zt6aYKqhPEqRcbp1EM+KuYzNRHkTBZfIuDbYnqQhnQZOONc6GTjgZ1fu0sbUgle0Dc7VJLsz2LFj3SUx1e5GbaH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 13:23:46.6279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c14ba909-8439-4170-601f-08d80ed3d629
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2999
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Problem

The Yocto Project releases twice a year (April and October): "stable"=20
releases are made every six months and have a lifetime of seven months=20
to allow for migration, while "long term support" (LTS) releases are=20
picked every two years starting from Dunfell in April 2020. The standard=20
practice for all Yocto Compatible layers is to create a "named" branch=20
consistent with the code name of that release.For example, the =EF=BF=BDdun=
fell=EF=BF=BD=20
release of Yocto will have a branch named =EF=BF=BDdunfell=EF=BF=BD in the =
official git=20
repository, and layers compatible with dunfell will have a branch named=20
=EF=BF=BDdunfell=EF=BF=BD.Thus, a customer can easily organize a collection=
 of=20
appropriate layers to make a product.

In Yocto, these named branches are =EF=BF=BDstable=EF=BF=BD, and only take =
bug fixes or=20
security-critical upgrades.Active development occurs on the master=20
branch.However, this methodology can be problematic if mimicked with the=20
compatible layers.Companies, like Arm, may not wish to release a=20
snapshot of the relevant =EF=BF=BDmaster=EF=BF=BD branches under active dev=
elopment, due=20
to the amount of testing, fixing, and hardening necessary to make a=20
product from a non-stable release.Also, changes to keep the master=20
branch of a layer working with the upstream master branch of Yocto may=20
result in that branch no longer being compatible with named branches=20
(e.g., it might not be possible to mix and match master and dunfell).So,=20
a decision must be made on the branching policy of meta-arm.

Proposal

There are many different ways to resolve this issue.After some=20
discussion, the best solution for us is to allow new hardware enablement=20
(and relevant software features) to be included in LTS named branches=20
(not just bug fixes).This will allow for a more stable software platform=20
for software to be developed, tested, and released. Also, the single=20
branch allows for focused testing (limiting the amount of resources=20
needed for CI/CD), lessens/eliminates code diverging on various=20
branches, and lessens confusion on which branch to use internally and=20
externally.The risk of making this choice is a potentially non-stable=20
branch which will require more frequent testing to lessen the risk, and=20
not following the =EF=BF=BDstable=EF=BF=BD methodology of the core Yocto la=
yers (though=20
it is not uncommon for BSP layers to behave as we are recommending).

Process

The process for patches intended on being integrated into only the=20
master branch is the normal process of pushing to mailing list for=20
community review, approval and integration into upstream meta-arm master=20
branch.

For patches intended on being included in an LTS named branch, the=20
preferred process is to upstream via the master branch then send email=20
to have them cherry picked to the LTS named branch.

If there is a time crunch and the preferred way above cannot be=20
completed in time, upstreaming via the LTS branch can occur.This follows=20
the normal process of pushing to mailing list for community review,=20
approval and integration into upstream meta-arm named branch.However,=20
any patches upstreamed in this manner must be pushed to master in a=20
timely fashion (after the time crunch).Nagging emails will be sent as=20
the time grows.

Branching strategy

Named branches for meta-arm will be released as close as possible to the=20
release of the YP LTS release.Meta-arm named branches will be created=20
from the meta-arm master branch.

To minimize the additional work of maintaining multiple branches it is=20
assumed that there will only be two active development branches at any=20
given time: master and the most recent Long Term Stable (LTS) as the=20
named branch.All previous named LTS branches will be EOLed when a new=20
LTS has been released.Any branches that are EOLed will still exist in=20
the meta-arm, but bug fix patches will be accepted.Limited to no testing=20
will occur on EOL=EF=BF=BDed branches.Exceptions to this can be made, but m=
ust=20
be sized appropriately and agreed to by the relevant parties.

Named branch release will coincide with Yocto Project releases.These=20
non-LTS branches will be bug fix only and will be EOLed on the next=20
release (similar to the YP branching behavior).

Branch transitions

When YP is approaching release, meta-arm will attempt to stabilize=20
master so that the releases can coincide.

T-6 weeks - Email is sent to meta-arm mailing list notifying of upcoming=20
code freeze of features to meta-arm

T-4 weeks - Code freeze to meta-arm.Only bug fixes are taken at this point.

T-0 =EF=BF=BD Official upstream release occurs.With no outstanding critical=
=20
bugs, a new named branch is created based on the current meta-arm master=20
branch. Previous named branches are now frozen and will not accept new=20
patches (but will continue to be present for reference and legacy usage).


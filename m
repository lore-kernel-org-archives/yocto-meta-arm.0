Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web09.28403.1623668939923262860
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 04:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kcZtBtnt;
 spf=pass (domain: arm.com, ip: 40.107.7.59, mailfrom: hugo.lhostis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDiM3n6hZ9k1FV6JiJs8L3+Cm61f7afQL1NDtkHI7pY=;
 b=kcZtBtnt6716YTumbCGCIx66W81jIi48dHmgWkB//QeVQOScDbh8AeGb/O80EymXUt8i1Ly9KUClGVA2V6elyoViq1ZO7ICFE/a+Pu459rpXFhVowKPrw15oUnxDKYtCEyVHrUB4W+Js+9d5qHWMFH0XBPpCymqN+4BvzxEBRAQ=
Received: from AM7PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:20b:130::19)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 11:08:57 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::76) by AM7PR03CA0009.outlook.office365.com
 (2603:10a6:20b:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Mon, 14 Jun 2021 11:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 11:08:56 +0000
Received: ("Tessian outbound cdfb4109116c:v93"); Mon, 14 Jun 2021 11:08:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 818679ca0ebecd38
X-CR-MTA-TID: 64aa7808
Received: from 6698b9613afe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9388E98A-25AB-4D9E-BCA2-2C02CB48A20E.1;
	Mon, 14 Jun 2021 11:08:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6698b9613afe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 14 Jun 2021 11:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZHHCHR49S1CoLeyUdURhMJJcAhE2GwXU8bEx5z/GZOoWBdw56I9IxfgX4p7DU3ipKOjwNFZUeg2UdEKR/Gn0kz34cQC0vh1mZd80YzSHTjgI15TJO4Q/sV7yTkSlPTbe1psVhqzLQDszsFTcHwYVfXmiaFJgNXph2th9WiZxCtYiV3+gESrbuQxJ+ULNcD+Wg77bEPLL5VZhWilrpOPEYQPn6/yAkePT42ACAvMMZF3+CeN3hG33B7Me6UMFiaUftp8ChWDIPM4lCVc4KnCxDDDELoK2zhda3CKytluen7bvbz0WCyVZalin6vhE78x+k4WJVb9agqHgq3bDVAWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDiM3n6hZ9k1FV6JiJs8L3+Cm61f7afQL1NDtkHI7pY=;
 b=IbVeD6nVMRht/emzRi94k6DBlf+yhifFcEL9XsaGTV6dOuA1Q0zvzWeEwtIk6A5qjUaox3uQCQCym8M1+tQLlWNuE9OW34PGYh4a0z8YDa5X7DYTUuvpPOl88/r8YDRzV/2qF8fy67AjFcQ5oULS3GgIm6rvU9fUfczWvI/rrdHF8HPEZxD/lPsFc3/+3H00oV+rdlG91AqEoF6LsWdoZvPPUrDaznuKUnZsYRzYIplcuUdPKXD5qRD3JkYShOJoJofQJcTs8Kvh9ry+HZPwIE/CJESzfYYu98v3pji6kaTB+Avto1RikK2cd3y6w3/U1Zg+5xME0EGyew19oMZExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDiM3n6hZ9k1FV6JiJs8L3+Cm61f7afQL1NDtkHI7pY=;
 b=kcZtBtnt6716YTumbCGCIx66W81jIi48dHmgWkB//QeVQOScDbh8AeGb/O80EymXUt8i1Ly9KUClGVA2V6elyoViq1ZO7ICFE/a+Pu459rpXFhVowKPrw15oUnxDKYtCEyVHrUB4W+Js+9d5qHWMFH0XBPpCymqN+4BvzxEBRAQ=
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com (2603:10a6:10:1ac::23)
 by DB7PR08MB3739.eurprd08.prod.outlook.com (2603:10a6:10:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 11:08:46 +0000
Received: from DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::9564:67f3:8ca3:e2d9]) by DBAPR08MB5560.eurprd08.prod.outlook.com
 ([fe80::9564:67f3:8ca3:e2d9%8]) with mapi id 15.20.4219.023; Mon, 14 Jun 2021
 11:08:45 +0000
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-network: add "none" network type to xenguests
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/xenguest-network: add "none"
 network type to xenguests
Thread-Index: AQHXXQb0hGvsI5IsdUOvqdSBBr3M5qsTYQZb
Date: Mon, 14 Jun 2021 11:08:45 +0000
Message-ID: 
 <DBAPR08MB55604FB546C12D976F64C5D686319@DBAPR08MB5560.eurprd08.prod.outlook.com>
References: <1686DB9E0E3B056D.32729@lists.yoctoproject.org>
In-Reply-To: <1686DB9E0E3B056D.32729@lists.yoctoproject.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 378b2c06-2385-4cab-0045-08d92f24cdbf
x-ms-traffictypediagnostic: DB7PR08MB3739:|PA4PR08MB6206:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB62060333E2A45A22C2B7DE2786319@PA4PR08MB6206.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dOh4L3TmFdV0U/KxjD5kB1fL5N9nNBcHacHTX+BISAVTRvjTLS2ZAE/xzJQEazLeZGEvx82XlO+zLOj/QyI8bkNVYLYFCd7ebN2Xjf9togP+5cXu8hapDOKsWpL1u72xZrLgiQHn9NwEvo+ckXJTyt4+G6qDOOknFioC2Ae+s9uF1zYieg1FeP+FFP6WxWMvzVY6cpbFqxsZkQLmoEQI7ZIx6Ml/Dhludw9Cs06hreT71L8ic01U+qbKk8KEfvOgjTFWG3J9/66o2Eetn9+CJkKWNoVzwgXyJXxxp7IXJBQx4zCTqt0vhSYH3oLwIeHOm6MoZ/iHrqfwom5yiVg5BZmXfak9QDMSgxwYvkbTk2xTfiGJAn1uWqzG+ZsQFJ8gTP+kwopFprX4H9oPv8puPNshaMXJh1FLhCpotf0ZQXiGyhqZatUS1t+YHM0H5ax8++DbSdmA7V/RiDtVbxY/qKRPfVo7h+fRlCcawJxb4YPk2EV6AjkEPRp0FPk0lGznELZ1b+GR0G8/Zu3vyQrSfXpzVjsF8kq+FfnFJmDWLkauWflyXrK9zzVj3/a2Tetkt6PSpAjPjEZLCy+n9NWMc0Vb+bWT8zOojVAa5CZIMHA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5560.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(71200400001)(19627405001)(66946007)(33656002)(66446008)(66556008)(91956017)(9686003)(55016002)(76116006)(66476007)(8936002)(64756008)(2906002)(4326008)(478600001)(8676002)(6916009)(186003)(7696005)(86362001)(5660300002)(52536014)(83380400001)(122000001)(38100700002)(316002)(26005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ri0F8E24SZg347pYRo5LZY0Zqq2p4yaPjeMRVGkQgDYvPWWH43BeYJQNQy?=
 =?iso-8859-1?Q?H1vSfDT2asZBxWW83Ye0gJZimw7IVmxO0FpGysUo+fmNK1cZ45UXrhr5no?=
 =?iso-8859-1?Q?OAbIDYq8Iq1lWxvMU6J/FtSCBfUYrQIqWMobMVbuObJvi1Miit3sJLSwFZ?=
 =?iso-8859-1?Q?tZjDK/r/vSQfZVd104ysGt34tpUHa2Xvr4QaYQ0Q7des9VxUPefHvqHUD6?=
 =?iso-8859-1?Q?rvrixFFtgjxyodNB+qUx6yzUGpQyxcLIdAMHGQOUQ1go/7Dm6ggRm1ZqWp?=
 =?iso-8859-1?Q?4XuoSj3boxorQNK+drZhBpfDn+fmlVUpNeznE0ISrjaOTaNQojMeFIU7Gw?=
 =?iso-8859-1?Q?4U9T+yN+R2MClWzxy0HUqVh2DHCTMmod3eaZ2gT5TGgvdi7hdzZ+gR9xG2?=
 =?iso-8859-1?Q?eJKzvANzGItyr06BkB+atbn36OF2UlyLDJhVFOyACrIBwmyGAuH/18HmAN?=
 =?iso-8859-1?Q?N6u+VaEMWIVqj/kfK6FXIfVh81kQ/ZSiJuCTJROIFanwVEAOjULs/0MMR/?=
 =?iso-8859-1?Q?hsfXFejrd07HZdFR3iBH5Qw/et3B8Jc1cnjYyvPqQhRJPMIbqkhG/B46ye?=
 =?iso-8859-1?Q?0JjaNEuMZLjpNwbeawDvqfSINV9uZ6MOBvxm0Fws1s/MN8IWPDgh6ZGrSa?=
 =?iso-8859-1?Q?+TLJM4oo1a/yonrKPRZaF4iwydIKmk7Nu0FaKoTNsJTdO8u/nAoGn3hc2Z?=
 =?iso-8859-1?Q?nQwkXrZYrCe6tKDT0d0/6BE7pCf7nX5eDauJTOZEWsFuV3KB+ypa81VSe2?=
 =?iso-8859-1?Q?jjuaenvTaHGqDwGlb+jO/5PwfSljixLjDC4X932CMu3xT++YHJy3Tj9JxD?=
 =?iso-8859-1?Q?4YgAbKoUWlhOYjBybbsA3byuG0SbG4NDGBgEmlVOptD0xJ92eRahIYm+tA?=
 =?iso-8859-1?Q?ahSlnjqhiIp7Ot5CG+ZCJX+ucAm0/FJEH4gQP/mq5yjK+je22As6Eq2I/2?=
 =?iso-8859-1?Q?e6+CJ6Xhat0YaPV/3iXaHYM/Jh5b6MFE9xFL6Z1vTlJ41POAf/7TjJK2EY?=
 =?iso-8859-1?Q?8/9Zq8HlW6nLkFbHioL3pKC/cHLKjfGQwLG150NjV1aNf0pfNEezIJ+qbt?=
 =?iso-8859-1?Q?U0bYo61VJDGrJHOJc3v2Y+iNl9pCT7gVuChRWdUm+YdPRT8fEHreqbqu9Q?=
 =?iso-8859-1?Q?HNVQ9/J1CNEl5C51tnoy2H6Q6+zxX+eqYTm14lFbOqGPxx35URbp7Qh+Vh?=
 =?iso-8859-1?Q?sxZ0clSJ1eTiYWBx2ffOz04OmGlEMfp4Kq2o/RcRauQhcvFwbkpIrh5/31?=
 =?iso-8859-1?Q?XcglGUR8bQjGzJAm95DRwCiN2rjQ1D1TtYBopBMJDdLep9ajKrooRL7CqX?=
 =?iso-8859-1?Q?PAuEIE+NT1BcvBFkZsSe0J6uQi/wBkdzu2hHtm3irY0hlQo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3739
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Hugo.Lhostis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aec94a62-b1e5-45cc-68e3-08d92f24c740
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k7Na2fotK9+FFaolXVZiOT9k/wQTsDwhllBUV3zsL2ftr2JxGQq5qy11eajS5fF1hzF3cZRnssFBaRDkPUvqYXlXPWBk3UVxLC4nqcLx+eudRpGXYS5KBwQ9CAas2ZlPXNhPkAt4BJA+4agJvIcfzfyt3DBX+LtUO/w8fKZssiQyLQwlZdho9an5rlkvu4/DZuy0saiyM0Onf+N2yfLJe00pxyUW8uMEoSAbOlKddyUj8thY3cE43O0s54KnEXe32jKOz9S8ff5vQx7RNXTxkEvUXcTUVx6i09ZokNJdYoEp6PGY7jyqcjMw48JFwcSpWIljZHFTdyQAk1Z6Jh40iJR97JKcOio/HgGQpEvCwD3Jhn29g57kKDLEvTHGVcMPLB2Fb1K5gdQhG4YBPcsDUfq+RWg3yRKLLr3glEvfyXlqLL5EN1CTGso+hnE/k3ospJjYKT7dkwgOXfdgTbrRjE6R4FdAzWkDwcvU68MgNycYyvxRrxaWlT51zTieZIi9p1iyP5yf9zA/p8dnJ39aYW7f5tqXyvAApugaMUj9eNf1xrX2zhHfcBhSG6BCzivH7SBWQa+ejMc9NqLB2u5+66zI8Zw4Eixok10Bty1ehA0nW9exea5mX4KPO74hfykOs40/qL/1J1xWjHyMAUZD5yawJeCj3TYXxIHgsUBietI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(6916009)(81166007)(4326008)(336012)(86362001)(2906002)(33656002)(82740400003)(5660300002)(19627405001)(83380400001)(316002)(36860700001)(356005)(82310400003)(47076005)(70586007)(26005)(52536014)(6506007)(478600001)(186003)(9686003)(55016002)(8676002)(7696005)(8936002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:08:56.5601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378b2c06-2385-4cab-0045-08d92f24cdbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB55604FB546C12D976F64C5D686319DBAPR08MB5560eurp_"

--_000_DBAPR08MB55604FB546C12D976F64C5D686319DBAPR08MB5560eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Jon,

Could you backport this patch to hardknott branch please ?

Thank you,

Hugo L'Hostis
________________________________
De : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> de l=
a part de Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=3Darm.com@=
lists.yoctoproject.org>
Envoy=E9 : mercredi 9 juin 2021 09:09
=C0 : meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc : nd <nd@arm.com>
Objet : [meta-arm] [PATCH] arm-autonomy/xenguest-network: add "none" networ=
k type to xenguests

This patch adds a new "none" network type that can be set for xenguests
using XENGUEST_IMAGE_NETWORK_TYPE in their configuration.

Issue-Id: SCM-2338
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: If4f6de282b0048e5c68d293a3db5b56cd5adce66
---
 .../recipes-extended/xenguest/files/network-bridge.sh.in       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-brid=
ge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge=
.sh.in
index e697f7e..10bbe36 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.i=
n
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.i=
n
@@ -17,6 +17,9 @@ case "${XENGUEST_NETWORK_TYPE:=3D}" in
         echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" >> =
"${guestcfgfile:?}"
         log info "Network type is bridge: ${BRIDGE_NAME}"
         ;;
+    none)
+        log info "Network type is none"
+        ;;
     *)
         log error "XENGUEST_NETWORK_TYPE=3D$XENGUEST_NETWORK_TYPE invalid"
         ;;
--
2.25.1


--_000_DBAPR08MB55604FB546C12D976F64C5D686319DBAPR08MB5560eurp_
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
<span style=3D"font-size:12pt">Hello Jon,</span>
<div style=3D"font-size:12pt"><br>
</div>
<div style=3D"font-size:12pt">Could you backport this patch to hardknott br=
anch please ?
<br>
</div>
<div style=3D"font-size:12pt"><br>
</div>
<div style=3D"font-size:12pt">Thank you,</div>
<div style=3D"font-size:12pt"><br>
</div>
<span style=3D"font-size:12pt">Hugo L'Hostis</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De :</b> meta-arm@lists.yoctopr=
oject.org &lt;meta-arm@lists.yoctoproject.org&gt; de la part de Hugo L'Host=
is via lists.yoctoproject.org &lt;hugo.lhostis=3Darm.com@lists.yoctoproject=
.org&gt;<br>
<b>Envoy=E9 :</b> mercredi 9 juin 2021 09:09<br>
<b>=C0 :</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoprojec=
t.org&gt;<br>
<b>Cc&nbsp;:</b> nd &lt;nd@arm.com&gt;<br>
<b>Objet :</b> [meta-arm] [PATCH] arm-autonomy/xenguest-network: add &quot;=
none&quot; network type to xenguests</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patch adds a new &quot;none&quot; network typ=
e that can be set for xenguests<br>
using XENGUEST_IMAGE_NETWORK_TYPE in their configuration.<br>
<br>
Issue-Id: SCM-2338<br>
Signed-off-by: Hugo L'Hostis &lt;hugo.lhostis@arm.com&gt;<br>
Change-Id: If4f6de282b0048e5c68d293a3db5b56cd5adce66<br>
---<br>
&nbsp;.../recipes-extended/xenguest/files/network-bridge.sh.in&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-brid=
ge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge=
.sh.in<br>
index e697f7e..10bbe36 100755<br>
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.i=
n<br>
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.i=
n<br>
@@ -17,6 +17,9 @@ case &quot;${XENGUEST_NETWORK_TYPE:=3D}&quot; in<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;vif =3D ['scrip=
t=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']&quot; &gt;&gt; &quot;${guestcfgfil=
e:?}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log info &quot;Network typ=
e is bridge: ${BRIDGE_NAME}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
+&nbsp;&nbsp;&nbsp; none)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log info &quot;Network type is =
none&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&nbsp;&nbsp;&nbsp;&nbsp; *)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log error &quot;XENGUEST_N=
ETWORK_TYPE=3D$XENGUEST_NETWORK_TYPE invalid&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBAPR08MB55604FB546C12D976F64C5D686319DBAPR08MB5560eurp_--

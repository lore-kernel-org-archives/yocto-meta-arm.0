Return-Path: <ankit.singh3@dell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63AFC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 10:33:55 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 by mx.groups.io with SMTP id smtpd.web08.62077.1643798033939208068
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dell.com header.s=smtpout1 header.b=yjZorsGN;
 spf=pass (domain: dell.com, ip: 148.163.137.20,
 mailfrom: ankit.singh3@dell.com)
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21248M21025432;
	Wed, 2 Feb 2022 05:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=awFXUe3GGGmSALy0afgF10G2O9iRNtD67IT/r8LRXjs=;
 b=yjZorsGNulkyb6zz6MYwIJ08PnlpHDbZDQh8s83KLXqkcZj0pNpT2JrQqNH80T5z9ZcN
 lWO6+3hhQfBDPH5F9pgoocSsfOzz3LY3t7/z4J8xcmQ4EZuyZbn8RWS8V3ogCoBkmi8O
 EJxz57V5rKLgVcTgyjOHMv9ohh8gm/Ts6GBmIrMSvdS7C1Q42uN+bZBOFZMrrqExENm9
 zW3eWN8Onm2osgBed/POyC1eKSudImdq1frafJsR58Y8Ua5ExRbrtb3PrC+nURkZrQz6
 gwYphrTBKNJKI28ICIUTnjiYsbw+Bfk1cE20f4zKQMSWw/MSYKn2yaJwEvwDG996eEjE +w==
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
	by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 3dxmva7pu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Feb 2022 05:33:52 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 212AVOjA119138;
	Wed, 2 Feb 2022 05:33:52 -0500
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0b-00154901.pphosted.com with ESMTP id 3dy3dyhgap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Feb 2022 05:33:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb2DiqtlXfxp9ROoYABHCJRAVvPxB1SQP9MQcnvQZ5VDy2qm4pUokMlCRy7nLgXEqFOy22sk6s3AFrWr4fAtkoDZ5XSsdhvCBxBbOOucehA0/hZmvU8EOrwi/opejwJpUoHXY6X8BDvLINnEann6gmWY8kqh9K/aRJd8P8NAwFlqH5efQuya1+g0SPW3yFyn9zS8C0aNEaODKCSnF0aAKbqLcMWzSM301w2lFO3ObeSVMJz7cbprmnltxCf2MkrUSLfJgNyZP1vzojgUtdOISy/qFoQSJalFGOvS7h/j99bwwnCzU+LCehc1vBaIPN7YCPeql2u4V8gP9z5SojDfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awFXUe3GGGmSALy0afgF10G2O9iRNtD67IT/r8LRXjs=;
 b=UpZhBLSWAiuN49amiOlowImGFPVQ/vujJLzM3R7my6rCGaRY/Y0bzZ5cEJWrfEvQHVpmZPimWO03572xMZLnHM+nkDnRN//v9Jy/KvdpvyZi39/lLDWLbmQ7IRRcST2yO+J6Fpvk3B3wR7C+LHGSa5C5gT0PWjWtPEtRelzGaUhMG5yafcKrSlow8ntUzlPeOKD4H0dcHPDjyWABuJMkmDobxmbGcxlcr8yRAFnl/FaAYl1fpdNuGXKIar7HQKCbCSDp2QDpFGvAFV6WsFd1tcfAmgPySVnPoo+aZtuxfX5AlaLh78KJZFEYugqmqharMSfvGalR3o7uHym53RRtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR19MB4777.namprd19.prod.outlook.com (2603:10b6:a03:2e8::17)
 by PH0PR19MB5473.namprd19.prod.outlook.com (2603:10b6:510:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Wed, 2 Feb
 2022 10:33:50 +0000
Received: from SJ0PR19MB4777.namprd19.prod.outlook.com
 ([fe80::353b:5ce1:40b:ecb8]) by SJ0PR19MB4777.namprd19.prod.outlook.com
 ([fe80::353b:5ce1:40b:ecb8%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 10:33:50 +0000
From: "Singh3, Ankit" <Ankit.Singh3@dell.com>
To: Ross Burton <ross@burtonini.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: RE: [meta-arm] YOCTO build for A5
Thread-Topic: [meta-arm] YOCTO build for A5
Thread-Index: AQHYGBv4xfWTzjd8vkq44cMUxn7JHayAD8rw
Date: Wed, 2 Feb 2022 10:33:50 +0000
Message-ID: 
 <SJ0PR19MB4777B5F5D538B302E952BDC1DA279@SJ0PR19MB4777.namprd19.prod.outlook.com>
References: <v9L8.1643787766540396929.pFFk@lists.yoctoproject.org>
 <CAAnfSTvx2A27=+usWmYo5SpJtWmR5Dis6z2Lr1PD7zSukku3-w@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvx2A27=+usWmYo5SpJtWmR5Dis6z2Lr1PD7zSukku3-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2022-02-02T10:33:48Z;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No Protection (Label
 Only) - Internal Use;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=92bdcd20-6f9a-43e8-8118-052e6016d8bd;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b1052eb-9c75-4821-2137-08d9e637808b
x-ms-traffictypediagnostic: PH0PR19MB5473:EE_
x-microsoft-antispam-prvs: 
 <PH0PR19MB54732504AD03ACA98313860FDA279@PH0PR19MB5473.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tbqxozSz7Y27lzSYSbJfLLoed0R4NqOWFLI+OSBzsxiE8035iXkuO6/QEN17v+ApX+AUHql87HNHoyC+QJ8lNpAsVRhJaexb9tfGAW6INpgxJJXrgUzdFvalDYfQPbaaWUSX1ZHExp9SmwGxFVBIjmnQ90pmf3rBrd78ozuuDixLuTErilLaIGh83xQmf22KWc2LiPXShDeHWtPCwoT76qc5JeI9WfK8jNwzH6pgcEBTKMA/u0HGTtojxmGFpCimDnkwnVVKhKwVMeffJ+J1tIj+uwD/CqLAQaMD/gUM5lZXKyVkffd0IvCNb3vcJl9d1BZZbToG/O2Y5bhm04mN/P7aydQb9SfwZot/sWJrjQ4DHwU/jIe3qB4NsI8L3FLi8a1e/oZzsWm7lp9VSclbTErrVN04bvcho5tHfwj+3owCUMVT5C9XGFVSERWRQotpoeSQyR5/k8UbyXOMIGUFL23hkZHKH6ENC0Gx3ku0b11xd3AOgrj1S48WXofKMcitufQ2QeB9mgweFzzyBQZmWTGpM1PA6NOZex3qEZxK3HyKZC3Ng6R381VMWzT54shAXDmqGBr8wciHry68kQ96j0hfI+/a281vqZLYfOo/608SqXiSbYTQTmRezZ8iuMfbxy1Y9ccMzCPHqkNEK3IAsDQP6YiCupVrMAgYyRbQLEA9RHSBfsmbxhsbdrgIROw8D6qhPzYGmgaFB6k/32TpiA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR19MB4777.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(86362001)(64756008)(66446008)(2906002)(7696005)(4326008)(6506007)(83380400001)(38070700005)(66556008)(66476007)(66946007)(9686003)(8936002)(8676002)(76116006)(52536014)(6916009)(71200400001)(5660300002)(82960400001)(508600001)(186003)(4744005)(55016003)(786003)(26005)(122000001)(33656002)(316002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V0F3aHVnTkllY3BDTW83M1IzekREUk5RT1JTUGkyZ2dac3daaTc1ZkZxNXVX?=
 =?utf-8?B?YXgrNVJTRnFjaXhGa2hVNnVEMmhPZTJ0SkxWS01PcHJnTmdYei9lTSsxdFUr?=
 =?utf-8?B?ZCtDbDJDVDBjalorVWJPdzlIWkFTUnNDbklWUmkrNUcvbm8xUTB0YW9VQmQy?=
 =?utf-8?B?VlZ5SHpPcEdxcjhKUVdENkFxT1FScjB4WmljaldndVFyaFhHQ2tOVnNFd2ZT?=
 =?utf-8?B?bVY4ZW9tdjBCTHZFcGlvZDBTU2RlemlSNXdyNWhCOElCMFFxdG9LYkVkdEc5?=
 =?utf-8?B?SkpPQXBqYnlDdlFsQWVETUFIYlNQSnRFVG9Wd1o3ZU9pakE0Y2RqZnRIMVZW?=
 =?utf-8?B?Zkhpbk14cHBMVDJrVHNXZ1ZVeEF5SDJ1azB5OEVGNXRyYXBSTG1wbDBQekd3?=
 =?utf-8?B?b0Y4RFFWSTV6TE9aMDdmU1ZuaW96WkhQZmFUbGhUZytSTHFNSkJzUUx5ZFRS?=
 =?utf-8?B?cEU2d1gwaTdWT3BnWFVJNTY2WHJjQlk4S1lZVmhZaXhoQ3c3R0c3emh1VXJJ?=
 =?utf-8?B?Tm1aSFVYQjhlcE03N2dKdFVuNVdUSzhZZWtkZzRhNVJYb291UjRGL1dCSU1y?=
 =?utf-8?B?eVhlWTd4ODJMa3pNMGFRblRsd0FFVTYvcW9WWk01MHZ1K0JackxhY2lsRnFC?=
 =?utf-8?B?bk43enZvYmFndFYzRk5WZ3RYdmhUMXFxbldPcUNKR0lKVG4zTStJM3VPclFn?=
 =?utf-8?B?a2xVRTVlakxnOFZocW1zbnZjNkFhclZPZTJua0EzSTk2c2JWRzVkSFdLTzFL?=
 =?utf-8?B?TnhJM3JBQzBweXJ0NmRCMnpiNW8wZUllMVF0bDNsWUJVUTVwcHRaZ0ZEaDFZ?=
 =?utf-8?B?Yi9FQW91MVpoNWtmN1VUOVluV0tBY2VjZlhjODk5T1FsQ0h5bHRhSENzV3hh?=
 =?utf-8?B?M2VONVNZRVVoU3NGNllWTWxHT0xKRGVFRHEvNDFQNFRvWVVCK1pmelBCQWJK?=
 =?utf-8?B?akZpcTNIRDVLRE5UUER4c2o3U0lhZWVaS2RKWkpjemJnV2lnQWdWWmtaNnNr?=
 =?utf-8?B?RzNxTVR0YnltMnBYVFFLelp2MWtjRi84UDZyMjlOV1NYM0JUam8wWjFtQTNB?=
 =?utf-8?B?bmJEN2hxWEFCL0svbGVZN0JOZEdXY2dwdjF0eTNWeVhJUGhUVkt6LzhOSHMx?=
 =?utf-8?B?dDNDaVF3cStEZWZpbzh4SHhGbDdiZ1B2eTFtdFQ4VHp6RmJyMWRaMzd5R1d3?=
 =?utf-8?B?R0FWQWlBTURNNDdLVFhXZ1U5dU5wbDNiVStVSVZucCsrVytCYzRUTmFBRlk1?=
 =?utf-8?B?ZlppLzlYUCtKMkpBV3pZZ3JTamtxeVc4TE5lWHJOK2l5d2k4YjI2b3hMMUJP?=
 =?utf-8?B?SEdXU3Bib09kYURWNHlVSTRWVU5BdFVXSm1JV2huZEhmRVdEN3h3K3hSbzhv?=
 =?utf-8?B?V0l3MHA2Y2dXWXNXWFBtTy9TYlNWcnBOZjRCakowbm9RakVPTzJ4d0hONHRN?=
 =?utf-8?B?ajJ4S0VPMEd2ZHV2WEJua3hKaTRadE9FbUlHVElLU3B0aDBJallEaDFwaGZE?=
 =?utf-8?B?OHVKbGdaQmsxb2xJcHY4cmNWNEZNWHhubU1ZWi9kZ0FsbzVIUVhJYmdTSU5E?=
 =?utf-8?B?UEVsbHRpT2pmdWF6aElEY3RWTmdiWmc1UVNSZXNDd29Fd2Z4UXhsN3gxTTRD?=
 =?utf-8?B?UzFIcjNEc1h4ZVJDaVhXZ1R5Ty9mb1RVZUJKZXZlZVhCcHpKQjY3ZFptRGFq?=
 =?utf-8?B?dlhDZHNFQmw3clZmeTRCWWJkYmRFQURxQld4U2dhOGhpZlVuRFBVR1ZjS25V?=
 =?utf-8?B?VG54Q2pZWHRNeGF6ZnBmdFdUNXNjTzJHMWlhd1BYWWFXMDB3ZDZhVTdHN0dk?=
 =?utf-8?B?SVd6WGcxOFlxVVM1WGE3NUdablZqSEdGcG9zZllYa2Fmd0gxTlFnNkFFUjFD?=
 =?utf-8?B?Tnh6MlluN2xLcnlmM2dyY0RZTU9kd1RqWVYwdndwc1ZIeVZpckw1MEU0U3Fr?=
 =?utf-8?B?WmdRWjBUbEVrRXJPcWV3TG9iU0RYWU41WXFORVFrQUZlVmNDdHdZc2c1bWI4?=
 =?utf-8?B?Qk5ZYVl2UTFSbWJkeDlYeWppUFA5OUk3YmFGSUpuSS9vQ2dSQW1uYitRMEpn?=
 =?utf-8?B?ZUVZSVVTUE9ZWVEyQ1FITHFEUXdWNXhEeGFNaFlMMkMvQWRtMjNBeXdVd25G?=
 =?utf-8?B?eW1XVDFpMzBQNEdKOTR1NHljWm80MXY5V2w4NDd1OC9aMkhGZ1g0V1l1SUtJ?=
 =?utf-8?Q?bE94SZhjK09n57yJtNcoDuY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4777.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b1052eb-9c75-4821-2137-08d9e637808b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 10:33:50.3202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bmRmIyhprpk+k99P6kNJ02IfxHtFLh8VV94UsS56hdufv5WMjMXdz3AzXVMyEQyt58Bbt8lYbWaGAGODuWWvWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5473
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.816
 definitions=2022-02-02_04:2022-02-01,2022-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=594
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2202020055
X-Proofpoint-GUID: hbfssIdEALg4GGs6TJ0dE_xpbmKaLe6O
X-Proofpoint-ORIG-GUID: hbfssIdEALg4GGs6TJ0dE_xpbmKaLe6O
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=735 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020055
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 10:33:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2940

SGkgUm9zcywNCg0KVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuDQpBbSBiaXQgbmV3IHRvIHRoaXMg
YW5kIGhlbmNlIGxpdHRsZSBjb25mdXNlZCB3aXRoIHRoZSBzdGFydGluZyBwb2ludC4NCg0KQXMg
cGVyIG15IGFzc3VtcHRpb24sIEkgYW0gcGxhbm5pbmcgdG8gZ2V0IGJhc2UgZHVuZmVsbCBjb2Rl
IGFuZCB0aGVuIGFkZCBtZXRhLWFybSBsYXllciB0byBpdC4NCkJ1dCB3aGF0IGFsbCBjaGFuZ2Vz
IHJlcXVpcmVkIHRvIGVuYWJsZSB0aGlzIGFybSBtZXRhIGxheWVyIGFuZCBidWlsZCBjb2RlIGZv
ciBDb3JzdG9uZTUwMA0KDQpSZWdhcmRzLA0KQW5raXQgU2luZ2gNCg0KDQpJbnRlcm5hbCBVc2Ug
LSBDb25maWRlbnRpYWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG1ldGEt
YXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+IE9uIEJlaGFsZiBPZiBSb3NzIEJ1cnRvbg0KU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAy
LCAyMDIyIDM6MzIgUE0NClRvOiBTaW5naDMsIEFua2l0DQpDYzogbWV0YS1hcm1AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLWFybV0gWU9DVE8gYnVpbGQgZm9yIEE1
DQoNCg0KW0VYVEVSTkFMIEVNQUlMXSANCg0KVGhlIENvcnN0b25lNTAwIGlzIHRoZSByZWZlcmVu
Y2UgcGxhdGZvcm0gZm9yIHRoZSBBNSwgc28gdGhhdCBtYWNoaW5lIG1pZ2h0IGJlIGEgZ29vZCBz
dGFydGluZyBwb2ludC4NCg0KUm9zcw0KDQpPbiBXZWQsIDIgRmViIDIwMjIgYXQgMDc6NDIsIDxh
bmtpdC5zaW5naDNAZGVsbC5jb20+IHdyb3RlOg0KPg0KPiBIaSwNCj4NCj4gQ2FuIGFueW9uZSBw
bGVhc2UgZ2l2ZSBtZSBvbiBidWlsZGluZyBBNSBZT0NUTy4NCj4NCj4gUmVnYXJkcywNCj4gQW5r
aXQNCj4gDQo+DQo=


Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BC4ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 18:22:55 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.13969.1663266169473716699
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Sep 2022 11:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=J7VUTI31;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B43BC5C0150;
	Thu, 15 Sep 2022 14:22:48 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 15 Sep 2022 14:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663266168; x=1663352568; bh=zHpCoScRd7
	OP2REBQi2FOASa8tl97GbHb5vwuCpQbxs=; b=J7VUTI31gfEE6PqwqwfEGlGPT1
	3I4drlKUbFMuxGlzXrTcukM2hOhAn95IarUGfMs6Srh4QkmOAOD/jPKbHgHRrcsD
	YbBw02ztiI7oOXDjWwb6ZtL5N5trfiK8MYcuKjumqjEniH/feGZyoAYkSpgQUdCq
	TReZpb6fcuOixuwgqJx0kRRI4KzPtC341FnQ1Jh6Yn0ilOS3DnhyLSg64XaO+jgl
	6e8k/MtKGHwGNJEyeAX/VC/LInOo36HoTxRL957E2FyxWsS1JuZuJBDqTzOJCjFo
	6LixmzyZ/rp/C7dFQzAgsZm6TltTUWtU2X7Ns3ySDkkVFhHlcYRSADrlrUnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663266168; x=1663352568; bh=zHpCoScRd7OP2REBQi2FOASa8tl9
	7GbHb5vwuCpQbxs=; b=dXtokoBP5j+Z5912E51P9o8HPx5dT9I1MXThF5fqP+6F
	iWFh/S6azkyAAglARz8WWMhey9aad7/bXhR06/rgFyJqJXlHJnnQJqup5e9LpApg
	VXHh3achI7nsUi346LJbbpbLxhEvYr4fRq+9EPxJJbPxGdifkTk08jSTWt5XAJPE
	wirG7nzBI/vESAuutWEY9odFGjP8DfD8ZRtU9AzD/Vjcgooat0JzkpCSwxZ7khZV
	5FXHFaT5+O2BeQ76fSAb0SCyE0pH4KwNY5becIY5UIMy0iypCEgIqjCa7ufq83rD
	6gcGIpylhQivokAm0Ars1qM3jzUvtsKD49lmrkTYLg==
X-ME-Sender: <xms:eG0jY8xVxtDA1tkUSFxugxBMdfU3HIQ5P3IsBQFErJIWUDQ9nKDJqw>
    <xme:eG0jYwTsjV30X5vYwJ_y5-m66D3S5A5j5yognRo0R_ukm8mMPhBlS4iu-ZFcONXeR
    VAxLxFIuVZ7vk29gCo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekgeegfefhgfehjefftdetkeelkefhleffvdehjeegffeu
    veffleekhfekfeehheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:eG0jY-VtiVqYvEvVPEr0yhBsRTvtzdHschOsYg9jL704cbV9xQ7z_Q>
    <xmx:eG0jY6j0Pi9xF9FJ9mLuEBxI8UZ_Bd-v_xk8qrRgJ_xJQihpoFqt7A>
    <xmx:eG0jY-DfwCTz881I4GvNsg0Qvd4eoFwSYnx58NM2HEMvn2y4nl7Jtw>
    <xmx:eG0jY5qCXkywmfR0dPJNjpOm8UM3HIxeaJ10E3OIvhVJ5MBB1-ncIQ>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31857234007B; Thu, 15 Sep 2022 14:22:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <6051968b-52d6-4d3c-9d60-5d2c142fbb96@www.fastmail.com>
In-Reply-To: <3CC222DA-0230-4E52-9FE7-B1D2D9437344@arm.com>
References: <20220915131530.1677573-1-andrei@gherzan.com>
 <3CC222DA-0230-4E52-9FE7-B1D2D9437344@arm.com>
Date: Thu, 15 Sep 2022 19:22:29 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Ross Burton" <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-arm] [PATCH] edk2-firmware: Fix configure sed typo
Content-Type: text/plain
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Sep 2022 18:22:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3788

Hi,

On Thu, 15 Sep 2022, at 16:06, Ross Burton wrote:
> On 15 Sep 2022, at 14:15, Andrei Gherzan via lists.yoctoproject.org 
> <andrei=gherzan.com@lists.yoctoproject.org> wrote:
>> -    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
>> +    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu.*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
>
> Did this break something for you, or is this a line that can actually 
> be removed?

It is definitely still needed. The template includes hardcoded values. It was breaking for me for arm EFI support.

Andrei


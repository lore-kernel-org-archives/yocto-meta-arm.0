Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF756ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 14:50:12 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.7385.1663771805710117587
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 07:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=IIjZvEKV;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A738C5C01AE;
	Wed, 21 Sep 2022 10:50:04 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 21 Sep 2022 10:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663771804; x=1663858204; bh=/whvqfZv9m
	gD4GefdqvsfloMAbmWvox07v/8iJKHqWY=; b=IIjZvEKVqgdwWoxPWDvABhfc5w
	3NAchvJOdP0refQVsB767zeW/vTEaIiQJWqBHxno7jZTcZ1tkrZUJ+oiOzmfPxKa
	JtJvTZvlD49tQ6r0d1zLmnuymxzcF/chVHbpZaQ3pXSOPkzl4vU3dmBBR5/mgGa9
	dwOMd2gmz3TWjYiz95a1mV6imBLGxkhe0zyYP2UJLbaV9rHaheBEZmXQ8EOYW8Ao
	ncbu/+5qFviha4c7J58up1lBj6s0IENDfRexucGOD3jpi5O/UMYs8PNO6P+zBMKq
	BpX9rrggvuVd1DS370ysy2E8Op6djqkaRoN9XEQItDu3yizqtEwWNU9fZCZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663771804; x=1663858204; bh=/whvqfZv9mgD4GefdqvsfloMAbmW
	vox07v/8iJKHqWY=; b=z/NOOLh0CNutZOuOjv7SEkMA6zUJaufhw/dN7AzY61ou
	WyZIwNG4mdt/O/bEXrxHpIr/eWrk/GPTvmpGGD2iANSnCZ3WpVW7b6BjXz1wmr0g
	mtlM9pd3yz9Ct7+0bcgv46DukmiCdiKrfs9AwLdN+KhxnyuGTY05f/wo2GF50G8j
	13Zj0FA5V8N779wvO5bA702JsVuSxr1fAI8a9LEjqyq13F07rzXSLXuKjOT8p3xR
	rpQQZJtn/wyn0DKziTnlM7NLZnjqc36x2dfGNZWdRd8wNgNmpA3NADhLP5AC7my8
	g66lHrWdyGhvnbLw5cdHn8b37rGsm/i/ibpW9l8yAw==
X-ME-Sender: <xms:nCQrY46LLVFJ3kHapZBIuMy76zTs6tL2T1cY7qh7Hh7eWocnSfCuLA>
    <xme:nCQrY54bpI5QAtz8heJ5Nt4rsx-a4AA4iBODkc_RsGjyue1dAk0IIb_pRdfeLQHGw
    fpNDXxwa325vT_yj0s>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:nCQrY3cOuJ1TN4FFX1CSd0xCPpVjOdZ0A1vZeV3X_zD6XzvupVFZxg>
    <xmx:nCQrY9J-9FCVMiYjeEGib39m9Q4R88vYIsCuHf-mcfJkvY6d0qqx9Q>
    <xmx:nCQrY8Jv5mOqWhDEcmm1At50ZWoMl3f046fkv0EJLD124QUqw6tlZQ>
    <xmx:nCQrY2zjNc6d_9uNWgSQZITVCsOfzXriGnpeLeuGCtySz-b46DLhKw>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0EF76234007B; Wed, 21 Sep 2022 10:50:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <c827cbe3-176c-4b1d-a2bb-6e0193146bd1@www.fastmail.com>
In-Reply-To: <166371340602.2604237.14459561646818257716.b4-ty@arm.com>
References: <20220915131530.1677573-1-andrei@gherzan.com>
 <166371340602.2604237.14459561646818257716.b4-ty@arm.com>
Date: Wed, 21 Sep 2022 15:49:43 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Jon Mason" <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [PATCH] edk2-firmware: Fix configure sed typo
Content-Type: text/plain
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 14:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3801

On Tue, 20 Sep 2022, at 23:36, Jon Mason wrote:
> On Thu, 15 Sep 2022 15:15:30 +0200, Andrei Gherzan wrote:
>> The configure sed operation will not behave as expected because '*'
>> match misses a preceeding '.'.
>
> Applied, thanks!

Awesome. Thanks.

Andrei


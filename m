Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFC2C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 22:27:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.36256.1641248844429071400
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 14:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CLr4HLK4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v7so72280107wrv.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 14:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HPbAL16IOh0tHAqTID2BxkWcasQhR5WlwaYkF7dJEBg=;
        b=CLr4HLK475vTrFPPoz4AsCHQDkUi7th5bFj1XZKzEpe3M6ogfB9k3eozD1j6Fx88kn
         o9yaSPsM4tEYWP2N8BLQQT5Jj59rVEfMtm4NVFhNUQzbF1LVi16ndlqGYQ9kqB997fyF
         wUOZlhHJ5ZQVJsezQ7kjWD2q6wU4LdSZANpBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HPbAL16IOh0tHAqTID2BxkWcasQhR5WlwaYkF7dJEBg=;
        b=tDRuNcIjK8L9FPvWQ+IbrKjDGqCVwGTzzDMZGO8MC3OgglFuepFwOhsAf/hEzWgxwy
         965gx1kLZlUIBjh3MaoJcpGkHc+iok7z2lOj5mFfvScUgxIlMFDI+FfoeZ66/+XGlrJK
         rBI+3ZhP76UWlnl9a/0L7USnkBW4Y8OhLz4kj+xPb59Lr/+1xqRDQR2qI9kF0ptQ49nh
         WYiapg29UqR2cM4enAkaBWM7ln+A9H2csh2f2knXLusj6yD88+QM6qbfoa6QKmGk8E3y
         zpbQav7fywCiFq/KjvLrkYrjKPo0+7hl1EURDR+gVg5vFwhR+f4xKAPzcVfCIyPU2uIB
         Ez0w==
X-Gm-Message-State: AOAM533Jn6ETpl7wf/lSmm8Qph88U/wz92ZFLVpX8E2KTN9vbjeu+kjZ
	G+KsCKQOP7EEAelNkqGL2EDGzQ==
X-Google-Smtp-Source: 
 ABdhPJyUgEKgP9TcA94EAPD9Y3fXcJE2hX4mif1VC1fH/2LloCFYGogqsETZPZoeJjV8Sx04kW9zHg==
X-Received: by 2002:a05:6000:1088:: with SMTP id
 y8mr41389194wrw.53.1641248842879;
        Mon, 03 Jan 2022 14:27:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da22:f51:54c3:4a4f?
 ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 l4sm35788521wrm.62.2022.01.03.14.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 14:27:22 -0800 (PST)
Message-ID: 
 <5f41546b0c3c904e9e5cca962fda4c6b48b5ee93.camel@linuxfoundation.org>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	meta-arm@lists.yoctoproject.org
Cc: Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Date: Mon, 03 Jan 2022 22:27:21 +0000
In-Reply-To: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
References: 
	<CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Jan 2022 22:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2773

On Mon, 2022-01-03 at 20:58 +0100, Alexander Kanavin wrote:
> Hello folks,
> 
> we (Weidmueller/Linutronix) have a use case where gcc-arm-none-eabi needs to
> run on a 32 bit arm host to dynamically build binaries for an arm32 baremetal
> RTOS. Existing pre-built recipe cannot fulfill this, so I'd like to propose
> swapping this for a recipe that builds gcc-arm-none-eabi from source for any
> target to run on, similar to Debian:
> 
> https://packages.debian.org/bullseye/gcc-arm-none-eabi
> 
> The other reason to do this is that gcc is open source: taking prebuilt
> binaries for it goes against OE principles.
> 
> I can do the technical work, but would like to hear opinions and feedback
> first.

Can't you just use the normal OE gcc compiler with the right flags passed in to
disable the auto library pieces? or if that doesn't work, use an OE built
baremetal compiler?

Cheers,

Richard



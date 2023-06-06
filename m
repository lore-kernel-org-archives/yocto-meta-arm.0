Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03CEC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 08:31:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.3915.1686040270574179500
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 01:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J9J5M9zx;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-97454836448so748215766b.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686040269; x=1688632269;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bm3QjekefqZgkGl6XRmqsxTgnM9VDfI34vQfhOkfuzQ=;
        b=J9J5M9zxfKvi225aTK+YdxoZulkVPcLtvz378L59ylnISh7SrOb+pcjritxu5cAUUE
         nOP/MxNjqI787WX7A8VkCMqep8ErTOUVEIqxOoAmoq55lbLk3m5y6hq0fj2By9FXJ3IZ
         ICrQsJTWM6itWN67/cbKhkvbYXaYGwQdLop/DqmHFvdYGsXE7L7l204CNaLkDAb0I6EL
         45uk969hXI55O2olkWLh36noFVyLllHjWD9i2DhdpkbKRUxD+kRNFcMb8kRwHVe8TWTR
         AvaVINePB1gtHQW7xTjNvXaMkLspiPROmQ6zIbJdEhzUnZAjkoVriZXs3ttJLu0L2EB2
         nbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040269; x=1688632269;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bm3QjekefqZgkGl6XRmqsxTgnM9VDfI34vQfhOkfuzQ=;
        b=GvUOgcko+3jHFowNa/EbWjGFangmBK6PhCkRt+tAsHRknY40WXGJG5GPBiY+t+X+1p
         eWwCWZIt0ubSvrOntIX+GcoRzt69FPnwMFJFA5jzw6EilULEqMLqz/PmTOZSGKNAtq7O
         XZ4STb0tROvOeAMoYG24f4kKLB/1D1wgum1xWlWmF6ohF2S9JAoLesBJwd37AJI5qVcn
         vRjhL5RNfmDI9G87+WAj+dlWjO0kts2JEeNe73VBfAHaV6n5eby3YOtJNxOz688KQhHJ
         jfXHP60E8h95kYRJMAZ4qS7IPG9JS9nN96II69BCFbx07a+Zx5444o4DUAc001C+U9Ll
         YnFg==
X-Gm-Message-State: AC+VfDy6it5dQabiLv03kYaxutjJK9FMHhB8fwTzgH7/0V/K2TUlIhzX
	ykc1wCFPS/C+RvYM4e8KSJ8=
X-Google-Smtp-Source: ACHHUZ5SlmPP4s6v0oAx+fXLScH2UtiNT+ZNqv/SfWS9OJONlbN+bYQBUmQqgpn5CLMVqxPfm7zR2w==
X-Received: by 2002:a17:907:94d4:b0:96a:48ed:5333 with SMTP id dn20-20020a17090794d400b0096a48ed5333mr1668295ejc.50.1686040268518;
        Tue, 06 Jun 2023 01:31:08 -0700 (PDT)
Received: from clst-linux ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906095500b0096b20c968afsm5288719ejd.124.2023.06.06.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:31:07 -0700 (PDT)
Message-ID: <0e1afb5121cd7096f79e15fa924cfbc901b82091.camel@gmail.com>
Subject: Re: [PATCH] arm-toolchain/gcc: Workaround for missing libcrypt
From: claus.stovgaard@gmail.com
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Date: Tue, 06 Jun 2023 10:31:07 +0200
In-Reply-To: <ZGOZSw2tlQ9XCLfw@kudzu.us>
References: <20230515111522.657505-1-claus.stovgaard@gmail.com>
	 <ZGOZSw2tlQ9XCLfw@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 08:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4730

On Tue, 2023-05-16 at 10:55 -0400, Jon Mason wrote:
> On Mon, May 15, 2023 at 01:15:22PM +0200, Claus Stovgaard wrote:
> > gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged
> > as
> > RPM for sdk with
> > 
> > nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-
> > arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk
> > 
> > This is a workaround by skipping the FILEDEPS
> 
> A little more verbosity here would be nice.  Something describing how
> prebuilt libraries might link to libraries that aren't present and
> becuse they are prebuilt, we don't control the dependencies.  We
> don't
> need a book, just 3-4 sentences.
> 
> Also, missing your Signed-off-by line
> 

Thanks for your review and sory for the delay in following up.
Will send a V2 shortly, fixing it.

> > ---
> >  
> >  BBCLASSEXTEND = "native nativesdk"
> > +
> 
> It would be nice to have a comment here about why this was added, to
> save people from looking at the log when doing quick edits.  Perhaps
> something like:
> 
> # skipping file deps because of libcrypt issue
> 
> > +SKIP_FILEDEPS="1"
> > --

Good point - have added a bit more description

Regards
Claus



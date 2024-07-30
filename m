Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E25DC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 09:32:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.13751.1722331925730733147
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 02:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TwQDcUS3;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f04150796so7428036e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722331924; x=1722936724; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6MA9ysbULiypm6DZoS3bpeqJC7V3Scl2lu1wZMnkUM=;
        b=TwQDcUS3bEyIqjL7iogHmXCJtKXpz3BMch32A/enq12+xPeWnv5njIXoX2AAJWZknx
         X/P5/3mGtyc+v74dtPtshXu0TnkEaj96vUbVcyZTBhgAO9FA5JpI/PRDlnrs9+k0AUp1
         3g+iRHNA/79lnAlejwRq5crqcZ+IhUWbKcMqC6qrcVDrjuFMBb2/9Mz16AWevvDlJLXj
         LlCBXe2UmGSIri9KckjYa0DcmMDnkc9qEa67jP58wiu3RCsNY1xdbwCdSZ4KOiS3LRyM
         ZzxwB5ZquHVyUpPI5qLL/HQMvXrUQeqZhn1oIDtQjy2n3uzf4KnWZj0TV/ynt9YV4Bkv
         Sw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331924; x=1722936724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6MA9ysbULiypm6DZoS3bpeqJC7V3Scl2lu1wZMnkUM=;
        b=sKrCUySioJSibvm2EUljNdoy+pEVg6liugATb1stnDWzydDVoVQw3ZJbVeiBvEgy9g
         K1W0oen8DkC4lwcucsLgfhZVJg+bYIUrZSC493GqUx7ZkKgF/CR4kkoSJsDq2ATJSDNa
         kRZ/ymhrLtiG9NyRJ4m92OcwFA4Yd3UBQSjJSsJfBWV09q0SLJQQw9vRy8EjZ911oT24
         1H02yb9MHLD22R/X+zBa+s8alJnmLN6rKTZsz0d86qLtYboQhQ2uKbo1Dwq+1caiNdE8
         zZHbzvJUS0SMiKgCIwj4EnU+W0A98NPZ/1eY4MnzWk9WEM/d8lRNB3+g8aXeytcsckLH
         MCWQ==
X-Gm-Message-State: AOJu0YyvD+wlNxhRHyT8wQucNSCXpJZvM+S1r+rN//7E9cSkguQDunrd
	JOtGG60li9kxV6JTgV1s4j8OKAa8dIDsxs01uhzG87hD6JMyrT3UvW96fcJYltOK9HwdHkDSNo+
	8
X-Google-Smtp-Source: AGHT+IGAt5mvNOnb8xeo8qMnpC0k/g+KPzx4TJdyyOr/+EhMeRvgda0lOWq4nLWswPCo8z3KEa7xOQ==
X-Received: by 2002:a05:6512:32d0:b0:52c:e030:1450 with SMTP id 2adb3069b0e04-5309b270854mr7092696e87.14.1722331923026;
        Tue, 30 Jul 2024 02:32:03 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2cc36sm1814550e87.270.2024.07.30.02.32.01
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:32:02 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:31:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/4] optee-os: asm debug prefix fixes
Message-ID: <ZqizD72goWGzQjGw@nuoska>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718134152.38721-1-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 09:32:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5927

Hi,

Is there something in these patches that is not ok for merging?

I'm following up the build paths patch with upstream.

Cheers,

-Mikko


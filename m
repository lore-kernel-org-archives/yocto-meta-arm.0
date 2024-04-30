Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AFFC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:44:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.14227.1714481074546547783
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xEpNmIKa;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51d2047220cso3709068e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714481073; x=1715085873; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4kn/s6+D0kc0STYM22GjoLC8Isqe/EmExfOkohD/Wk=;
        b=xEpNmIKa9yTbibjyuJ+6tGPhBJZVzIJNukW6n60vTd4yfwSlwv9dPBUqeWncOKtnOK
         3EIw/QkUI9NWmkwemEBPOb0AXHDPLhbWgZiRGXeCdMskMt8p6gxpBzKu9j1MtcaW++BR
         4re0/kMCqGFv3klbyVy99OYjMN8o7j+jafRco3sbyYGkiPJ4tFv96gUTjuo9JPZrNQLq
         3pUWd9GUlJGpDK9VCbr9snpEmS51ZyZaO88OjkNMG6q3oVfk8wjAK3HVGM8UflovIQk+
         syUFtMVOf3wbMKc5coEui9Y9MY1a/UQ7wjyLm4M2gdmoAFevREqvZ/zr2CzIyhSc8kje
         1QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481073; x=1715085873;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4kn/s6+D0kc0STYM22GjoLC8Isqe/EmExfOkohD/Wk=;
        b=WXdLQlIM469f3iajV59jBnWx4oeXe6ussK2HZ/wlZ2OBMVF7FN5O0SDkOCgDgfSGft
         b+TJLP/dmQiLkdVuBQczfcnecS//iZr2oZwy1n5k2wxRWlxjJd5xDZHX+KCE4nbyQ2sr
         2gJdiv+KJCZbO/JsK7cNXeyNbHeM5L3iyqGVfMjahah0qNdCWaNmTZH7qhwoL5/3IPAk
         JR0f8GtjNDfSXwT2KYMVIFRZQ/E3Jt4ucW4/zVtBOFpVTgAUBB0FhJJRYBMi9Pqwk0pM
         SlmBXE49fXpLjAyRBfTyR6eDHYBLWzlDz1NYAyCTITJ5bOGYIzy81I8sSzPGLerlCick
         gH8w==
X-Gm-Message-State: AOJu0Yxz7AISTPhVz84v823VUGnx7btjo8NhIyvd6YlF34rkP6fYgVpb
	wyG3uT8KHebcYFvS0C/3HQe5aqq8dhYpDakVOedkmX62G+rr4xiHILlk2wSSyJi8ySwleZIFuSb
	3318=
X-Google-Smtp-Source: AGHT+IEljktOYDJuTLSUrzfn3nJZsAWZdYYvl9v0LCwjdW3H7cWD2nhwHGmx9KVHE1ptldvuZvBUzg==
X-Received: by 2002:ac2:5316:0:b0:51d:348b:80bb with SMTP id c22-20020ac25316000000b0051d348b80bbmr5365573lfh.55.1714481070695;
        Tue, 30 Apr 2024 05:44:30 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id br36-20020a056512402400b0051b402a3809sm3033680lfb.307.2024.04.30.05.44.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:44:30 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:44:28 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 2/2] optee-ftpm: enumerate also without tee-supplicant
Message-ID: <ZjDnrE1v7dQnc1D0@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
 <20240417110722.283283-2-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:44:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5648

Hi,

On Wed, Apr 17, 2024 at 02:07:22PM +0300, Mikko Rapeli wrote:
> Userspace like systemd boot manager would need to know
> how to find TPM and fTPM devices for rootfs encryption.
> Thus expose an fTPM TA enumeration also without tee-supplicant
> so that early boot managers can start tee-supplicant and
> wait for the fTPM device before continuing with TPM2

Please ignore this patch. It depends on kernel and optee
patches and depends on RPMB availability which on qemu is simulated
by tee-supplicant making the patch wrong for qemu targets.

Cheers,

-Mikko


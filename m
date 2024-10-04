Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC12CF8843
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 14:21:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.23409.1728051657127221957
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 07:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qnopg246;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398df2c871so2406840e87.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728051655; x=1728656455; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuecViov5MOBIrQrcCGVdb9HocbgQXGiseBT2lclt2g=;
        b=Qnopg246OGlZ2LmmIoqe852B7jMzoYlnMIops8yIovB9O7JPRXy1D2V9H0VbXR6Dq2
         ihW8Cr7heNA77SEECEXuSq4ZUgP3ect9a6f2pU8FdhLZQN8LmW+wNcT5fqQDlOZuU3RH
         UPBsZgtGvfjD/Udesg6Pamw1aGRy0p5xx2YjcPaklaOHjjFlb/4HKYgkrLMf+y/MKP2D
         3mz8x8F25BdFa02T6RmQKXmbrfRJlIWy8n8aXeaQAixNdtLNw24+PnTdBHr2s6P4YM4Z
         tH2bnNUY80BGEOr/mxl89t9fTneHiwjMZiyhlYesCMhwNFNI3J5s6LXgRt9TsQhaOfwY
         dOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051655; x=1728656455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuecViov5MOBIrQrcCGVdb9HocbgQXGiseBT2lclt2g=;
        b=nX8TZ2u7mZmqi6z5UyHKcGw4OL6njgg1JG7ApGucCpH1euRw1Zcz8dw/Elfg7PB+or
         jeQ3zb3VbsR8aXnNnr93fFteBSMZsz5imUJvxu5VUzdg18uHPR5PU1wQYyEs2plYa03v
         W2QeGVIK6Zj7iGWpUdu/KpSFkU8u3XVE8BtURuWS1iJU2si59k/DaD+eVsS7W6S+muAl
         HGisjpRPTiUzJECX4gnW1+swoxaSa/6Kf1TtFq+gs8TalPAZrygJJj/J8/pwGsWjSAkA
         uCJwCebPV0pz1M/4K5bTbGPjBN8grBvsk1U12u1cw0uQM72RGwZ0YPlcPf0iAkKjofXk
         vF4g==
X-Gm-Message-State: AOJu0Yy1HBf+w7waAjQzBdC7xTVWWdqKmSLBGsou7VKW+gCVBIDs+nxC
	Q7zuWzPIFSdstddnhTEaanrG8dfnfSKLh2Ry5GiWE5Y3s6CeJPnV1NRJj0MJCI5zCPuAJP070G/
	97CY=
X-Google-Smtp-Source: AGHT+IHlvjuld6OPJ6aiD+mSMUqqkQrINmC6zKTe1Y1QMkS88klQrWyRdNav3r4dMz1gaEdYKOfA0w==
X-Received: by 2002:a05:6512:1092:b0:539:8a47:6fa with SMTP id 2adb3069b0e04-539ab87335dmr2082625e87.29.1728051655061;
        Fri, 04 Oct 2024 07:20:55 -0700 (PDT)
Received: from nuoska (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82ab00csm437162e87.262.2024.10.04.07.20.52
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:20:54 -0700 (PDT)
Date: Fri, 4 Oct 2024 17:20:51 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH master-next 1/2] ci/uefi-secureboot.yml:
 include ci/meta-secure-core.yml
Message-ID: <Zv_5w83bLu1D9U42@nuoska>
References: <17FB41AB89EDA2E1.4329@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17FB41AB89EDA2E1.4329@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 14:21:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6172

Hi,

squashed this to v9 of the UEFI secureboot patches.

Cheers,

-Mikko


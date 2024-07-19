Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4251C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 09:37:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.15194.1721381818242841355
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 02:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ipCaTNbX;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso1804149e87.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721381816; x=1721986616; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uU+1ajJ52fHccy4LvRadWWI8d5IHcWKl03AKlcQmBrE=;
        b=ipCaTNbXLsnvr7+hAuWNj988tEKyBR4WJTU/bNB1jqNOZkGv6FDmbfo5GTDPEJsPPj
         Q7sUgZMRPyPVeihiOB35LChh1wGuMZM5TldH7tyyiH7T0QsgQlmJuRAnJz0z9GxE3HOt
         kpO5797A1Bbwe/4VDS+6YVg0cUeHbGNmHvzI8lPvW2RxjxUU+EwutmUBsgB+NmyyziH8
         kNCjk5dZn1NFbbNsVzGr/cYrq6aRUkHsh5JlPyHEAs2e6C9KugIjm5eUjeeb11F/1EwR
         yT9hBT3X/Td497J3l2FDQcAD+8xf2Cv5IZIdrnCEcyYrqTfxXwbxfCW2g1sbSvcnbzUh
         EGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381816; x=1721986616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU+1ajJ52fHccy4LvRadWWI8d5IHcWKl03AKlcQmBrE=;
        b=N7P/RpgmuBEPNj/d1xN4kgYLrUHZ/EICCbE9r2S+tFnuzOPhe60NP3baeCRwKzCf/O
         xPlb7TXI1VK0Qzj9yOql5pFCCwYc96RzvYCc1CghuHdf6VxeM5w2tfLghtoKkkWsJTH9
         B8is6W4zDfCtHP0wsiBP8QiTJj0AmUK5lK8b7zP9rhH+8G4YVdbHo4HogzQBQcoVr4iR
         tLwJXzT7sTUpmaE+H6tECrbffksqOGo65smQABUiMwOHXkpRInlVh8dAPUTs7E+zm51Y
         TmVFSaekF79F6u9TCFqjwrYSm5/UWCUVTjodr6sdSnxDZcsvinxlVISzIXOXWawzNzQk
         qBlw==
X-Gm-Message-State: AOJu0Yy+e2EcTUbzx3BlAYfr5gn0MMJNCzgHxHjMHM105F+Coc8axCOx
	TWQ6bT0uYQMQ++V0s/zT7xMXNdwherBNzNp9wYaYTu5Q7QIewWPMxPwAkq0P1nsHIvx3Xa9E/3M
	g
X-Google-Smtp-Source: AGHT+IGzsFrIbGFahOxq1hX9sXhJCYg3CE/bg6uYw14XF3JdWtgpDp4iQDUneYPAGX9yvLf+hT+Z+Q==
X-Received: by 2002:a05:6512:130a:b0:52e:9cb1:d254 with SMTP id 2adb3069b0e04-52ee54271e8mr5291740e87.46.1721381816262;
        Fri, 19 Jul 2024 02:36:56 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5581685sm140580e87.298.2024.07.19.02.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:36:55 -0700 (PDT)
Date: Fri, 19 Jul 2024 12:36:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v1 6/7] qemuarm64-secureboot: Setup UEFI linux-yocto and
 sign kernel image
Message-ID: <ZpoztYugk5tjrSkb@nuoska>
References: <20240718203526.52214-1-javier.tia@linaro.org>
 <20240718203526.52214-7-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718203526.52214-7-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 09:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5909

Hi,

Subject should be "linux-yocto: sign kernel image..."

Cheers,

-Mikko


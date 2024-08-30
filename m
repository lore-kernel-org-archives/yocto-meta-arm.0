Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D0ECA0FFA
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 14:14:19 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.16448.1725027256920559430
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 07:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RME1gxnv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4568780a168so8899061cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725027256; x=1725632056; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIkBG4GjAUgkaQgS9fkdWN0/ZtL4kxGiLJgYBTdIbOU=;
        b=RME1gxnv23cyQhAem3QbG+khmahWI3mxAnaSOBxhlYn3bye/v+GcHJZQL4mCm09u4L
         mYFz5n/Lrv48mXklcKS0aZ3HnFWkdv0Fzq+pdC16ZU6HwAko2nHuLUbf09bDVsYaPQbz
         kfU/tPQH3Dzj4DEbiu9hkufuY+aZYydjZCZ94uK4plKwKS8j/JifuFP2IiyRBL1VXiiF
         E0/j3V34TV5GF+SJ5afCyDMKxwy9e9T0XpH5pkckq1I7ZjlkOYoV0d5SDeEaUIRZMu2o
         LimaSW2sHNt9/zFAAQ3i2UQwSvM5TdvizFyZ8rj56lCb6d0hRXZkAW2vfqePYulflsaK
         +NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027256; x=1725632056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIkBG4GjAUgkaQgS9fkdWN0/ZtL4kxGiLJgYBTdIbOU=;
        b=FziNedJ2zrLs7I8RoW5IxkqKGhxbN9l2u+1uBZHBCZu6xqSfSGx0zW6awE4PIm9MoI
         7IK11vGZlKrzdRcs6w6ixOMx2FMuXNxP8RdfL2PeTMpbBgqElvu0qN2UORT8yF/6NH8y
         Lc15GFBeBpg8ePUCHcdlHagxZkEgX2cbNvfVvGJxE9vmTuwrZP4clpHOYHO2kDbzhZNf
         MDLQNlX5G46pb5prmqY9Uv/08+kG9r063BNQ4j9S/jV6bgerxWxidAxDHDVr89z5+1xN
         al4nEbil2I/AMUMWVDQ9KzYIeGFiYgYLntbci2NAAVXWOob1ybvpqCgMll6fMfELODBz
         NXqQ==
X-Gm-Message-State: AOJu0YwE3AbjH/DBFK2wsy3nFP6RcbBsVL/7wCVRF4D2fWbBQGASMS1z
	4+uwdgJTSumr1hi6VIQEop31LNyRxEfdy6iVi1GyK7xGMx4x+d9+SSx85omxCA==
X-Google-Smtp-Source: AGHT+IFpQF1vcU7nyxlczwtclBUD4DJcgOlEG8bCfpi8+Jk6usYlQsoEmt0c69n2FwAvgQnfOyQVDA==
X-Received: by 2002:a05:6214:5905:b0:6c1:6ec9:605a with SMTP id 6a1803df08f44-6c33e61474emr75210646d6.13.1725027255578;
        Fri, 30 Aug 2024 07:14:15 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c437a8sm14727436d6.61.2024.08.30.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:14:15 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:14:13 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 06/13] core-image-minimal: Inherit uefi-sb-keys
Message-ID: <ZtHTteGmAzXPvwjm@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-7-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-7-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 14:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6032

On Thu, Aug 29, 2024 at 10:32:02AM -0600, Javier Tia wrote:
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  .../recipes-core/images/core-image-minimal-uefi-secureboot.inc  | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> index 351e9030..2232d3b3 100644
> --- a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> @@ -1 +1,3 @@
> +inherit uefi-sb-keys
> +
>  WKS_FILE = "efi-disk-no-swap.wks.in"

This should be squashed with patch #2

> -- 
> 2.46.0
> 
> 


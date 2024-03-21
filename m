Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE096C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:20:53 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.2812.1711041644228683097
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 10:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UDhg2OJq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-789db18e24eso85093985a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711041643; x=1711646443; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1GIKZhLPids+CoBWxy5TMV/Y76w/Cf+6gUMjhHQM+A=;
        b=UDhg2OJqUPJUzIbw2JyK54J/qzhX6OEeD9TuVAF5OVXv9aklw6Y38FfbhOot5weoPu
         oRhpvgSAiAOytBZSxm8f9bwBbAdtezRKUStEFKDtm1CkQI/gqmQGdlVlQggu/6zGXxyy
         7L7/unG18t4e5OeRi07nuRNgBet+6mKQ75+1BwK3D5jfNuva8BMT6FCX0WeqrrBVYW3X
         bURBl+gGzNHYnSZDBs3m6pwMGyYomz34ozbVghroxxM63ENM8D18P6B8VdoSfEsRfAas
         UPG8f+CG5ZuWgjKBW8sQ4VMK6vfm3AtjK+0mVxvrHCC2v4tC4R3GkaZoMAP7JA0I+28M
         fp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711041643; x=1711646443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1GIKZhLPids+CoBWxy5TMV/Y76w/Cf+6gUMjhHQM+A=;
        b=a77oZVFi/hPYDWexMlFKSyZTe7YgdpTlmEd4mBQsaI2MKFQvzd1skofr5HftOGofYb
         O1WRQYpPLGDR+CuFhy+bCjm0+4f76Z7Z/hK/fGP1K/mS18wVlFbe91W0h9XLaQKRkTQy
         K4TbnUN5+YWx745qlNoqP4hwtPDovg1IM54wPk3ZEqX8VeSLN/BqFb7CeqQf1FYUyRZV
         +HLR3lvHqEKlrSUsfA+hbaVYWbbecpY8BRj3KUIrhZuqLzPqlHFW3f6KbbH5VMyml5oy
         Is/N4AYsh/+vxZIOxj6d0az1YIeeZ0VF45/Dwq7JHdFaZd03ulEbalLcBzzhLKr8zgvQ
         yScQ==
X-Gm-Message-State: AOJu0YxPOy/kw3KBroTReVERtwTKu+9cmCCKoreikHZxFgU8LiQF31YD
	l/YrVVc83jQq3WWKWBSZmpPV5YVDJkiDmdZMDfZi8LgQaQR6fN9+7uKKqC5Ekw==
X-Google-Smtp-Source: AGHT+IFAeKQNFiOVezGOyW34ZbEwQ20oRZNb8KJ4ye96lqskN0mqHoooQeMe1thpZOUtLl19O8GCJQ==
X-Received: by 2002:ae9:e648:0:b0:789:e2c1:40ac with SMTP id x8-20020ae9e648000000b00789e2c140acmr2934751qkl.11.1711041643192;
        Thu, 21 Mar 2024 10:20:43 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e10-20020a37db0a000000b00789fc91dcf1sm62432qki.87.2024.03.21.10.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 10:20:43 -0700 (PDT)
Date: Thu, 21 Mar 2024 13:20:36 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/7] CI: update kas to 4.3.1
Message-ID: <ZfxsZOWSAAR7swKI@kudzu.us>
References: <20240321143312.85262-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321143312.85262-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 17:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5480

Disregard this series, didn't rebase before sending.  Sending again
with just the relevant patches.

Thanks,
Jon

On Thu, Mar 21, 2024 at 10:33:06AM -0400, Jon Mason wrote:
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 15cf4ecdbb79..120cbe3e9458 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,4 +1,4 @@
> -image: ${MIRROR_GHCR}/siemens/kas/kas:4.0
> +image: ${MIRROR_GHCR}/siemens/kas/kas:4.3.1
>  
>  variables:
>    # These are needed as the k8s executor doesn't respect the container
> -- 
> 2.39.3 (Apple Git-146)
> 
> 


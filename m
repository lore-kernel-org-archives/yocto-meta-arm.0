Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37795C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 06:36:06 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.37329.1722407761497620911
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 23:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j9lvHg8+;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2c109eabso69831531fa.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 23:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722407760; x=1723012560; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vNrzVJi52632EMg7hx7nx7DRFyY0WTINwhrKMP5nwY=;
        b=j9lvHg8+HEQjO7pWv0ev99wuMZf+Xo2/N/sptmI9BBaYtGzF73HE2j3jLbtBsMs0p+
         K+7tDOI+lwG6MGVfQPuxnBhKR+JcYpqOLGHmpanX18NZcLLhiGrwOUZSjGvrdiYFcV6P
         Gy2MF5CgRzNlwlQ93JMJWl133LRkqi7Gwz7nqOJy+IhQbGx81S43p6XER8ktMfWkg+no
         l3mA4saNnnnsf6cblEOI9iN496pSVKDbF8gIf5gFxjxw2wemcSdB824INJkTMiy3EX/F
         XoV1BbhxSI3Z+tfc++xjZHBCGhRV/9CGXrOEHdVAImdZA+RlVx3E9TxtueOJs2YvecFG
         VkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407760; x=1723012560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vNrzVJi52632EMg7hx7nx7DRFyY0WTINwhrKMP5nwY=;
        b=auB9Hq4AdjfrL5fqVT7KDd44j/t4JMEVYi2ZCWaJKmR8YA0uZDYOUwnq0vyC5Y8bFd
         HF/Ee3pMJhUdndOkIiaheZy7HEUHODXXSZCQGlW9SvgmZZ9xwCzkEZyCjBLw1oJOVqkt
         foNPJ3N47eewB6bgciejWQJ6zNvaUE8+dDvSJdIFt38YajoC1UBcS5Gmr9Yc6PWE6X4m
         J5bY4/IaOr+WV7cCrXZkBmiUc9X8S0b18pYqNzLmue6H8wxfkkN1qJ8osCytVcqMwaN9
         5C5g6ymUI0MhvvfnpXUSJ3MvhsctjwpFgc0+N5Lr+g7qRGQlZEjlULjVy02C5bFIDuV4
         s8Bg==
X-Gm-Message-State: AOJu0Yx+Lfp75V4m2WL6Hq2Owj8Imzm6dd+/CrZq4cXCxD5lshNc9MT6
	a45mKuKonPaWGKrrGJ3XCaLaahEom4a2CLMsiDCO7E1+be72wjNOjw8E1/VKInA=
X-Google-Smtp-Source: AGHT+IGZDqZTDCzBesmMDAuUem6xfjKtmffYPlNoIwD8M9eiTk1AozypW7L8nRR0MUZNI6vblvJX5g==
X-Received: by 2002:a2e:8198:0:b0:2ef:28ee:944 with SMTP id 38308e7fff4ca-2f12ee2f300mr82401051fa.45.1722407759370;
        Tue, 30 Jul 2024 23:35:59 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0d79esm18853801fa.19.2024.07.30.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:35:58 -0700 (PDT)
Date: Wed, 31 Jul 2024 09:35:57 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/4] optee-os: asm debug prefix fixes
Message-ID: <ZqnbTSo2JxV2m6wr@nuoska>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
 <ZqizD72goWGzQjGw@nuoska>
 <ZqmrjL-EKud5PJSn@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqmrjL-EKud5PJSn@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 06:36:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5934

Hi,

On Tue, Jul 30, 2024 at 11:12:12PM -0400, Jon Mason wrote:
> On Tue, Jul 30, 2024 at 12:31:59PM +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > Is there something in these patches that is not ok for merging?
> 
> Sorry for the delay.
> 
> Something in CI was breaking and I was trying to isolate it to the
> individual patches, but the CI I'm running that is publicly available
> has been having issues (which I think are now resolved) and the
> internal one has been bogged down with a large number of reviews.
> 
> v2 that you just sent is now in master-next and hopefully will be
> happy when I get up tomorrow morning.

Ok then these optee changes are likely not causing issues, good to know.

I'll wait for the master branch update, can't see master-next changes.

Cheers,

-Mikko


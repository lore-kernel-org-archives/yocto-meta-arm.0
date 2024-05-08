Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C672C25B5F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 08:07:31 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.7100.1715155644521100240
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 May 2024 01:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f7VOvC1M;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2db13ca0363so60952541fa.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715155642; x=1715760442; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8A1pfjrAGiaA0NJQfh8iqWb1lHjCGSFsZQAplMltBoA=;
        b=f7VOvC1M+MWfdy8Gy1V5R0KP78SR+MFrG3rWu4psi/EFUAyrUWEeyXmMNb+G3LqH7G
         3IrUIbTVzzRF6HWuLGSdxRS8xjyQYhhMuUvTZ7emIWLDjQhodZJRSTCJUXVuEDvHebgX
         YjXC2MhZFrVlI/4zpb8Rszi4RmEXJ/0uXDIibztyiaPV/vOTsc+cVT4je3mlvYTtmjgy
         1iRfP8ptP3WAYNphanU28f8ni7mn6SfSIUoZNBCY6jyJ1/C1w7tWLritXtabwkGgh1B4
         Vr1SmxwHKpDB0uPxdh4sXJoH5jpAg0gQsZQzRLAJawKraiCa42c4YvZ9idk6B4HcgV29
         QlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715155642; x=1715760442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A1pfjrAGiaA0NJQfh8iqWb1lHjCGSFsZQAplMltBoA=;
        b=CMErAHtZqgGrJ6g4W9ieeKa7azM5hcNtgBZr163jDE/UbJZRGglT2S+KKGa/ucPaxE
         JpFaGAQ8X2moaUhLeunZH9+NZzQcP6QPvN8CMQQ28sQhocm8BhfnNT0eXEq7jwNTRwEC
         BvngUY/m2lkzORFwKH/U7S2aLTKchMlVAPlpVPFjHA7pn7//nHfVnrr3kCF7oG96O4Aa
         APN8WZszRu3OHYEmFA2at4LEhNevtRXQBPAwi+56oYpu4DI0EHPS4uq1l9+DiS0BG5IE
         1AfUXYglQ4AmROWfctAJzlasLI5FdcfdbE+87F3a5XHDAEH7a5IzrqkwXxWdWbz3ec6t
         76Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWRtRAhdzGKerIdkWwH0la1Nd9GzkTvuADSrAXqyzSruIphD2Iv6/aGTTJKqmZGsAnpBACVXtOsppynd55Aep2fR3aW3MsI8VFDRt2jUKSs
X-Gm-Message-State: AOJu0YxLYyVhKuSPwfkic1VtIWIn79SBo0ek1/rOg1XbgtRHYVzn8Qlv
	MCmb9GWHpWPc11ekXP7mN72TipR0DNR8HqSeC295k8856Z63J8Nf+SSycagodLI=
X-Google-Smtp-Source: AGHT+IFnnOaB2ISjtPQVKczk6PD2JV8NorLy9ofcrx+bgn+8JZDBlTgxnHBlmepOdZeB1N8Z1TaSbg==
X-Received: by 2002:a2e:9f03:0:b0:2de:75de:5b0b with SMTP id 38308e7fff4ca-2e446f7b280mr16630001fa.18.1715155642555;
        Wed, 08 May 2024 01:07:22 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e7214000000b002d46be28dcfsm2316133ljc.127.2024.05.08.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:07:22 -0700 (PDT)
Date: Wed, 8 May 2024 11:07:20 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jdmason@kudzu.us
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 6/6] arm/oeqa: increase optee test timeout
Message-ID: <ZjsyuL4qzOTFw9eK@nuoska>
References: <20240507173313.50788-1-jon.mason@arm.com>
 <20240507173313.50788-6-jon.mason@arm.com>
 <ZjpxMOWWTU2y4+qs@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjpxMOWWTU2y4+qs@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 08:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5705

Hi,

On Tue, May 07, 2024 at 02:21:36PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> On Tue, May 07, 2024 at 01:33:13PM -0400, Jon Mason wrote:
> > OPTEE tests are failing in CI on slower systems due to timing out, but
> > actually finish when given enough time to complete.  Increase the
> > timeout value to be roughly 100 seconds longer than the time it is
> > currently taking to finish on the slower systems.
> > 
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> This should have:
> Fixes: d4507866677c ("oeqa runtime: add optee.py test")

Yes, the optee xtest execution time depends heavily on the target machine,
real or emulated with qemu. Also, the number of tests and thus execution time
are increasing in every optee release.

Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,

-Mikko


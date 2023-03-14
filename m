Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AECC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:10:02 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.11431.1678806595193813216
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 08:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=37PKdUnn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id y3so11419289qvn.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678806594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uk77AKce3F/3mjqSJ19NaWI+b3VUw9eJypngSCpcROM=;
        b=37PKdUnnP/Zuqt2rN95AelxbGoCgm8Ki90wJyCa40aN12qvNZQczfi4GmcYm7jcq5I
         VBqlxjS9CJ2tqfFs4wbUDBU1g1jPcAiP3Ue+F5jQ40uZsu6VZtHJmT1XxgrTFEk8aE1Z
         vk35auzNl2UNLZKgHQ9dM1pGN/vDBsmratYNdoV9qONvI4ZdQfczpQvgg+an3QbC+ND6
         OpVorhK0UGObTjXNQvYwH4p9JZXqhrOn98Kh15N9RWOfG5osDR5B7CIGTfb9WId11GK1
         ujOBdtYyH9hQl8KZIwjnorXoD0We/lZiYx6SuYxtykRcXgcvdwNEhC3baOggmFzntOxa
         /Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678806594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk77AKce3F/3mjqSJ19NaWI+b3VUw9eJypngSCpcROM=;
        b=1Pvj8S/8bcczdKTJinnhFl2sSUBQawr+yj2gU/Qo6S9uuhSuviU3TWGCAesXKzqKRM
         NcVkFNZi7mzp2sgwy8arZBKaHkeDaTel05s8COqWLBuMhKWdm7/ckkc41sQqXiTVU+qC
         M8QqBU0POUkCdo1OpZeY3s3yZnDbtoCXd4oFBJH9qZt2dMpoi/AJmQUQFcQZrfyTsDH5
         Ta7AhU1Z8dgVQwYJiHQCifXDTUtnEEuVQD3LgLe4EFq0i4LqQYuzCnwsQ1N3vYQjdbwQ
         Swlfe7kxa1Tv1JNwTTr5ksox4BHzVIGnoOTqbGvsIMdhaD9XgCOEpxqhympCcHZPtuRP
         TOGQ==
X-Gm-Message-State: AO0yUKUZkAokYeQ/Nq7xiYTl4Izi6PnP7BWZ8dBcRaDUtOdJc9i0lqi0
	8UYpcilwdzMi1VodIa5dEPAFNw==
X-Google-Smtp-Source: AK7set+ZjmHA+IToqsZgcbz3QG6anLDD9Y9sp3hMJKXKlOsvCrVTUbD/a33nnL/e8F74o5FiDG8Pxg==
X-Received: by 2002:a05:622a:1443:b0:3bf:c994:c9b6 with SMTP id v3-20020a05622a144300b003bfc994c9b6mr63032455qtx.29.1678806594118;
        Tue, 14 Mar 2023 08:09:54 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 71-20020a37054a000000b007436d0e9408sm1891881qkf.127.2023.03.14.08.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:09:53 -0700 (PDT)
Date: Tue, 14 Mar 2023 11:09:52 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] arm/trusted-firmware-m-scripts: relocate to tfm
 directory
Message-ID: <ZBCOQNGgM/R/tZDT@kudzu.us>
References: <20230314142404.501077-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314142404.501077-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 15:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4489

Disregard, emailed the wrong series

On Tue, Mar 14, 2023 at 10:24:03AM -0400, Jon Mason wrote:
> Relocate to be with tfm to make it more obvious when a version update
> is needed
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../trusted-firmware-m}/trusted-firmware-m-scripts-native.inc   | 0
>  .../trusted-firmware-m-scripts-native_1.7.0.bb                  | 2 ++
>  .../trusted-firmware-m-scripts-native_1.7.0.bb                  | 2 --
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-arm/{recipes-devtools/trusted-firmware-m-scripts => recipes-bsp/trusted-firmware-m}/trusted-firmware-m-scripts-native.inc (100%)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native_1.7.0.bb
>  delete mode 100644 meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
> 
> diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native.inc
> similarity index 100%
> rename from meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native.inc
> rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native.inc
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native_1.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native_1.7.0.bb
> new file mode 100644
> index 00000000..504846e0
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native_1.7.0.bb
> @@ -0,0 +1,2 @@
> +require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
> +require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native.inc
> diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
> deleted file mode 100644
> index 2e9e5249..00000000
> --- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
> -require recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native.inc
> -- 
> 2.25.1
> 
> 


Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939ADC38A2D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 06:18:57 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.3516.1666851530910865282
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 23:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZS0bBzgf;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id bp15so735820lfb.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 23:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wbOBO7o59Dz7tBG/JzMwxIVQq+rzFwTwmZxzhQ2vJcE=;
        b=ZS0bBzgfOChSK6/Bk+pp2VslHZe/TcRHZCh3OUeIO8Z7L6xlcwrYDXZNRkFNbBr9l+
         QTgaesI9XxBAj0AgObxrZ0Ky7jyZXm0ByXfKZRUffXPydW6sHQ5O587fXZQen0Ig371u
         NeS9q1srAICXhPrjxHemQK53IkZNx6fOGr/olrL8EKkVAElczCWP8XGkzGS1JG5VHwqF
         01+1ThCv8nEzoWsTl7yaYMFvr/R0yUAUemoTgF+kWPE8+hKBy4e7S4l11SvgYsPwlaEQ
         8RSKlGcvPE3wLxaA8M9P/iHXBCNQoXcPrE4M+Y+Zj9rMAlNu3hp5pVGv7PHOZkfEbn3Z
         cgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbOBO7o59Dz7tBG/JzMwxIVQq+rzFwTwmZxzhQ2vJcE=;
        b=s9LPgyAEr/DAqVGUIEzRVB+ZyuYXW6mO+bo0mddOEby9DXgGY8XSdIYKy90hTJA6Nl
         hyi3Rb58+XKqy30Xv6WkANhtGfo+Ttxc7YUB7G0D6kyess7mrZnjc/5xr/fn9DFqdbDY
         HNTknRk5rn2iN3+E318yB38x9MjPfEY1+CHMBcFUDnz+Xtt7Zo9TVjFU9SEFjrHzDuXZ
         O4odlWPSj0414OPWYWt7jxFzy5TYdNv5gzvAgfsE3mL/vnkQGTMWyklK42KHwJrOPn+V
         7kPlT8LvLDfkCeXRMBrdUSpzs91+wXFn4gJZWQrcnNnlg26WURjX4liwQ7fhQZwKwzZt
         WIew==
X-Gm-Message-State: ACrzQf05V7snxvyEoFYK+QX5OVZqDgR/NlvrwIN8aABCjB3EmMNMNuo6
	QOHp+lrx66ZsKCUJxB+MbO2X8Q==
X-Google-Smtp-Source: AMsMyM407qDYEuGsEk1gpkK4mDG5ID4/fTcTZU/ClfAM1F4LIgA6vGBnh3AG75eVcNGR634+XCSKug==
X-Received: by 2002:a05:6512:ba2:b0:4a2:5522:d35e with SMTP id b34-20020a0565120ba200b004a25522d35emr19552204lfv.390.1666851528604;
        Wed, 26 Oct 2022 23:18:48 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id c23-20020ac25317000000b00499fe9ce5f2sm63489lfh.175.2022.10.26.23.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:18:48 -0700 (PDT)
Date: Thu, 27 Oct 2022 09:18:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-arm][PATCH 1/3] optee-ftpm/optee-os: add missing space in
 EXTRA_OEMAKE
Message-ID: <Y1oixbW4wq5PILX3@nuoska>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026141854.1557213-1-jose.quaresma@foundries.io>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 06:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4043

Hi,

On Wed, Oct 26, 2022 at 02:18:52PM +0000, Jose Quaresma wrote:
> When append to variable a space is required at the beginning.
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> index acea7502..40423615 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -7,7 +7,8 @@ DEPENDS:append = "\
>                   '' , \
>                   d)}"
>  
> -EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
> +EXTRA_OEMAKE:append = "\

There is no need to use :append here. += will do and will add the
space.

Using :append everywhere without machine or distro qualifiers is
an annoying antipattern which intermediate layers should not use.

Higher level product specific layers can't easily change the variables
which have been amended with :append.

Cheers,

-Mikko


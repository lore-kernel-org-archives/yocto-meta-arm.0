Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web12.10214.1595504203371711811
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 04:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vC5YBUY2;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id q16so483106ybk.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jul 2020 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/sNK8D6kwaORFBgo887vmnhcuAVzSkAMQFpF0LPFp4=;
        b=vC5YBUY2C1zyLkRmChyJlPw7+d0Cp3Zau6e+qAUqKMcRrDMNwTSdsXMIbL3qWOKgph
         hW/zoAvQ7r1gbT+PMZV7mGgxCusdybTd03qVEuaqs+RneZtvKF9j30JJ/dwWd7w8BJKf
         gwkqU7UnNMwMmSXpEgPHyHP0lD0oCA9J0DJKCsXYYkjDKPjJjJVUI+NZt3GTkAXxI7oz
         dQuCXA6EWJ6wWoxjzmtVdgbtcLt9gCb0WPGmqrbFhVuwFaR6kcdmywiMWqz+LUakPiy2
         SS2J+KAr1NwHUyojr7/il0rNDV24VTUJiCh71uAxNqCOCe5IJJZJHBVOQ/ooPp/SQCvl
         giUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/sNK8D6kwaORFBgo887vmnhcuAVzSkAMQFpF0LPFp4=;
        b=Ncyf4rmnhjN8Xs/UKGkVZyWJX97KM1yKfGTsG5Vc40qL5JrEmHAzWqS7KTtZLd861u
         4SJDBQhX4HOoy78kfOviU4tPkZT4EeKfEEa+yLYSaHmM6A13oeV3thLQqGAHzxXqF7PP
         IbW3+OSKdVIH22JNITd1sJloenxWNucYLtLBzOf3s11ahNG4c/ENqqqn9Td1eD9VYBHT
         pn0LM7Rsv7A0umP/WJu2FQC+wDf74K7xol8pk27a75TWqA0flknJGE13Ok/KGa2LnwmU
         yOKR7Kbt8fmqHeFASeflyMcQtqw5Tokk4z4uvab5MxvsPxxs3va5Ci9Hn0vaKKNldKN6
         QPHw==
X-Gm-Message-State: AOAM532JREBkzw7LAoj2JToalxp6y2Ak5X5IAwaTqgkAsqJ//ZnZ9JYS
	hBJ6m1tpktcuznoeBvWbcUedKURinbfsCa+0wJHFPQ==
X-Google-Smtp-Source: ABdhPJxswLNv2XOQMhkt1WxWKug2wTIoVSu/ATfeiGG0coduKz7nT4wtWNiNNDa46ewa310AKPHv40PlIhN4J+HRrTY=
X-Received: by 2002:a25:e407:: with SMTP id b7mr6426126ybh.371.1595504202438;
 Thu, 23 Jul 2020 04:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200723113115.22309-1-khasim.mohammed@arm.com>
In-Reply-To: <20200723113115.22309-1-khasim.mohammed@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 23 Jul 2020 13:36:31 +0200
Message-ID: <CAP71Wjz45ONFZ6PiUadG33Y2Fp3JfJLzED8LY4hjm32GvfrDEw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: fix WKS dependencies for N1SDP components
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 1:31 PM Khasim Mohammed <khasim.mohammed@arm.com> wrote:
>
> Add build-time dependencies to ensure the required components
> (TFA, SCP, UEFI EDK2) are built and available before
> the task to create wic image gets initiated.
>
> Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 139f619..7925969 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>
>  # Set default WKS
>  WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
> +WKS_FILE_DEPENDS_append = "${EXTRA_IMAGEDEPENDS}"

with _append you need an extra leading space.

>
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> --
> 2.17.1
>
> 

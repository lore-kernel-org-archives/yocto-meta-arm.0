Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CABC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 16:41:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.14632.1636476106238447506
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 08:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=NlQpurhH;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id i5so34115339wrb.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNk2DBHYM6xZr6MESsEwS2K5HeniHcpaK+0xmSgdHy0=;
        b=NlQpurhHgVS3ab/hsx3WIz2KIWyqmECrJMGNID+DahVwE2lIXeU+TI328FqTVns4g9
         9tTbzTlinnwzKM5C5gU5wUu6PT8sZZvpZtxy1K1rgJOFDPTtT/K8RmmREWZrEMRF00qy
         w5bklJlGWOqIuYyifzH+zppytML3Aiqq1W17l1Z2zmKPoUGOB87c27iJmnwb0lm5LmD7
         ZBKqxZa49S2NX6eslhfV0LFP1a38IO5Axs4m1qt0QQk1xWUt+oUZR+ZYmKUGcP7YG8YO
         NV9W1pOr9gk4DsffJq5lBv7SjXUCOESB2ljDtA8I79JFJb3iaaYeaIsJ9rhoOoaHLJbU
         gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNk2DBHYM6xZr6MESsEwS2K5HeniHcpaK+0xmSgdHy0=;
        b=M0iNlnrlj9cy89X3C4KpuCgY7xqcruBP8QxpFFUosvuNteHLjvA/PWHomMLv09+uEx
         RvJs2HH3VdpY5PpOIwyv9xW4V2TXyZZl/2K/EfrVIE40mA9CtSNBnslP3Nrvc/8os4Am
         s/cidLO8/3rLPBgT9H1yOcKFuc9XGUdmk51s88bUdaZU6iejTzGG/2Hgo2V2gN888MJf
         vPMIYzOOMe6RrwD8mNV6E62UziKL9idegE4hWh4fhxtLqSqwAAPzG9f0IHaAElV5UR4J
         IlL8EYFl6Xz6zqkIN1LC6jq9bjCnlqtNzwaee3hMjHiOlfEccRF+4UWTLg0JElD10vWL
         2dIg==
X-Gm-Message-State: AOAM5303atADgISCgxY+d0xFF6MnKN6v4iG93AJpC/rT2D2erG7SFV0A
	j8EH+CoB83S4Qt/mtmjG0piZPCt9CPTKhRz47o6szA==
X-Google-Smtp-Source: 
 ABdhPJzf50dvOPi34aDtUg/j7N8Zs35cdlx4XiKfxVoJLB3hddqkV7BZi7XxR0b0gRcffvEIGDMEHy4hecNJq0giboY=
X-Received: by 2002:a5d:6c6a:: with SMTP id
 r10mr11534215wrz.211.1636476104674;
 Tue, 09 Nov 2021 08:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20211109163506.36513-1-luca.fancellu@arm.com>
In-Reply-To: <20211109163506.36513-1-luca.fancellu@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 9 Nov 2021 16:41:34 +0000
Message-ID: 
 <CAAnfSTtL8rtVZhiZfc+NTzVYXmfT2DOtpc=dRHG0=Ti8P91hyQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH honister] arm-autonomy/xen-devicetree: change
 Xen dts and n1sdp dtsi
To: luca fancellu <luca.fancellu@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Bertrand.Marquis@arm.com,
	Diego.Sueiro@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 16:41:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2353

Should this be applied to master too?

Ross

On Tue, 9 Nov 2021 at 16:35, luca fancellu <luca.fancellu@arm.com> wrote:
>
> The current Xen dts produced by the layer is using an old
> way to specify the dom0 kernel module that won't be supported
> anymore in Xen 4.16 when booting through UEFI.
>
> Change xen.dtsi.in to have the Dom0 kernel module as a
> direct child of /chosen node.
>
> For the n1sdp, Grub2 is responsible to create the Dom0
> kernel node and properly setup the #address-cells and
> the #size-cells properties, so modify the dynamic layer
> dtsi for n1sdp to remove these node and properties from
> the yocto generated dtb for Xen.
>
> Issue-Id: SCM-3647
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Change-Id: I35236bbb3fe97e4237bc5c45fb521efdaa472ef1
> ---
>  .../xen-devicetree/files/xen-n1sdp.dtsi             | 10 ++++++++++
>  .../xen-devicetree/files/xen.dtsi.in                | 13 +++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> index e3c3294..f85def7 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> @@ -38,4 +38,14 @@
>              /delete-property/ iommu-map;
>          };
>      };
> +
> +    /*
> +     * Delete module node for Dom0, #size-cells and #address-cells because Grub2
> +     * is responsible to create them
> +     */
> +    chosen {
> +        /delete-property/ #size-cells;
> +        /delete-property/ #address-cells;
> +        /delete-node/ module@0;
> +    };
>  };
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> index 42d12fa..c1352df 100644
> --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> @@ -1,16 +1,13 @@
>  / {
>      chosen {
> +        #size-cells = <0x00000001>;
> +        #address-cells = <0x00000001>;
>          xen,dom0-bootargs = "###XEN_DOM0_BOOTARGS###";
>          xen,xen-bootargs = "###XEN_XEN_BOOTARGS###";
>
> -        modules {
> -            #size-cells = <0x00000001>;
> -            #address-cells = <0x00000001>;
> -
> -            module@0 {
> -                reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
> -                compatible = "multiboot,module";
> -            };
> +        module@0 {
> +            reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
> +            compatible = "multiboot,module";
>          };
>      };
>  };
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2352): https://lists.yoctoproject.org/g/meta-arm/message/2352
> Mute This Topic: https://lists.yoctoproject.org/mt/86935341/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


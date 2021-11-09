Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD54C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 17:29:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15351.1636478955992220956
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 09:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=FswmNGMf;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2816733wmz.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5KyP0NcFuQujM3O/i/DbTscpx5v1TPKXfgy7YHNOpA0=;
        b=FswmNGMfEqRpwxNqF/cSJ1VtFfK8Bm+skGW48MFSg+UZeOqOjlnINaLhWqCbOj34zm
         byXWh3UThVqDXBMIdRQzKm72FBxxPJ/s7DAASQUszfLIKvYUhB0FBEL5IXEPUKxHk+eb
         CpqGMGKFCA3aj18QN+3fP9JQXuoPG/z0PLHZSUcMJs9j08vNTPMQBKYs8APPu8yuBZDt
         Nu75yevBUQRAw/iWh1c7xwsvsDqad7iWcnOiGi0B5r1SwsHu+UlD6P6V4QYctIrtadU6
         NByApKws9/7C/NmHHn8lK+O+/PBHojINTHjzPC8ripx4vavUrKeVx29neOy8kuF+JLVa
         h7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5KyP0NcFuQujM3O/i/DbTscpx5v1TPKXfgy7YHNOpA0=;
        b=19+jEbWDoWEiSYcYivDilVJZ0ApmvGnk+PwRtl1lPibAppBsNgGCmuYSQbJMOqKODq
         dcEWE/G7pgeg1bWv22st02YHhU169J3Ddz/dSso1zj+W4e40ZNKFaT9Jwo8sZxYjDB9Y
         B0Y0GKOykEHpBhDfQw4LnMbI+oT5XMZXIR9VtMZlELrhLItE7wA4PvE7kx8Da+c5zpG+
         CrthEccEqxYvHDVaiSPl3MkT7rHNehf0EJTPVVTwvngR7RyYTzzJOGVtobOexSPwsrzc
         cNYZdluMyuz4C4LQPoEUW1FsdhX3eSrIHdLCeNriGM+vDqjUkedpREKu8yzgEyY/cs0j
         DwAQ==
X-Gm-Message-State: AOAM530eEZy6pfj9cXztufPyn3QD7Weqrkjfu40kQ2uFB942ShyFqDLd
	lFu7/GpSc84ItyZPdbyyIDOA8d1MavYYOM5NaxOjkw==
X-Google-Smtp-Source: 
 ABdhPJxW/nRWMtYdwpufW65mQbVYc5KZy8+0BCb/+S061F7Owp6Yg/kX0sqXcGb619s+9AIgG3hnrd3eIhvJHl+iZSY=
X-Received: by 2002:a1c:488:: with SMTP id 130mr9094484wme.157.1636478954364;
 Tue, 09 Nov 2021 09:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20211109163506.36513-1-luca.fancellu@arm.com>
 <CAAnfSTtL8rtVZhiZfc+NTzVYXmfT2DOtpc=dRHG0=Ti8P91hyQ@mail.gmail.com>
 <AE7BB059-4C57-4B19-B497-1903125371D3@arm.com>
In-Reply-To: <AE7BB059-4C57-4B19-B497-1903125371D3@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 9 Nov 2021 17:29:03 +0000
Message-ID: 
 <CAAnfSTuwkJLj=-E3N=fm-e-Moy_+go=A8yU_ApXxiHZ8YUx-jg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH honister] arm-autonomy/xen-devicetree: change
 Xen dts and n1sdp dtsi
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Bertrand.Marquis@arm.com,
	Diego.Sueiro@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 17:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2355

I knew that, but someone forgot, thanks.

Ross

On Tue, 9 Nov 2021 at 16:49, Luca Fancellu <luca.fancellu@arm.com> wrote:
>
>
>
> > On 9 Nov 2021, at 16:41, Ross Burton <ross@burtonini.com> wrote:
> >
> > Should this be applied to master too?
>
> Hi Ross,
>
> no meta-arm-autonomy has ended its service on master on October 2021, only on honister is fine.
>
> Cheers,
> Luca
>
> >
> > Ross
> >
> > On Tue, 9 Nov 2021 at 16:35, luca fancellu <luca.fancellu@arm.com> wrote:
> >>
> >> The current Xen dts produced by the layer is using an old
> >> way to specify the dom0 kernel module that won't be supported
> >> anymore in Xen 4.16 when booting through UEFI.
> >>
> >> Change xen.dtsi.in to have the Dom0 kernel module as a
> >> direct child of /chosen node.
> >>
> >> For the n1sdp, Grub2 is responsible to create the Dom0
> >> kernel node and properly setup the #address-cells and
> >> the #size-cells properties, so modify the dynamic layer
> >> dtsi for n1sdp to remove these node and properties from
> >> the yocto generated dtb for Xen.
> >>
> >> Issue-Id: SCM-3647
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> Change-Id: I35236bbb3fe97e4237bc5c45fb521efdaa472ef1
> >> ---
> >> .../xen-devicetree/files/xen-n1sdp.dtsi             | 10 ++++++++++
> >> .../xen-devicetree/files/xen.dtsi.in                | 13 +++++--------
> >> 2 files changed, 15 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> >> index e3c3294..f85def7 100644
> >> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> >> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
> >> @@ -38,4 +38,14 @@
> >>             /delete-property/ iommu-map;
> >>         };
> >>     };
> >> +
> >> +    /*
> >> +     * Delete module node for Dom0, #size-cells and #address-cells because Grub2
> >> +     * is responsible to create them
> >> +     */
> >> +    chosen {
> >> +        /delete-property/ #size-cells;
> >> +        /delete-property/ #address-cells;
> >> +        /delete-node/ module@0;
> >> +    };
> >> };
> >> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> >> index 42d12fa..c1352df 100644
> >> --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> >> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
> >> @@ -1,16 +1,13 @@
> >> / {
> >>     chosen {
> >> +        #size-cells = <0x00000001>;
> >> +        #address-cells = <0x00000001>;
> >>         xen,dom0-bootargs = "###XEN_DOM0_BOOTARGS###";
> >>         xen,xen-bootargs = "###XEN_XEN_BOOTARGS###";
> >>
> >> -        modules {
> >> -            #size-cells = <0x00000001>;
> >> -            #address-cells = <0x00000001>;
> >> -
> >> -            module@0 {
> >> -                reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
> >> -                compatible = "multiboot,module";
> >> -            };
> >> +        module@0 {
> >> +            reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
> >> +            compatible = "multiboot,module";
> >>         };
> >>     };
> >> };
> >> --
> >> 2.17.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#2352): https://lists.yoctoproject.org/g/meta-arm/message/2352
> >> Mute This Topic: https://lists.yoctoproject.org/mt/86935341/1676615
> >> Group Owner: meta-arm+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>


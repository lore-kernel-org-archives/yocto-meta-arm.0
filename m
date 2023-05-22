Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8BEC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 07:33:38 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.16652.1684740814297333414
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 May 2023 00:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=Rw66i/5C;
 spf=pass (domain: linaro.org, ip: 209.85.222.41, mailfrom: sumit.garg@linaro.org)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-783f88ce548so3439987241.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 May 2023 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684740813; x=1687332813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eMo1K3cE4MTtaeyng9kiU/B9LEe1GkpnkCb1adZ6lH8=;
        b=Rw66i/5C34gToCZlHHGrDd6TCGfYQnLfwx2RaoAsNAP2ssit4/kgx3p3QVR+nKjfKW
         12fb/59IZkW5+/Px7DV7olYVNG4tlPrLvkAbaa2ZkNAqUxCItLu0LP3nlUQO1PO2HlyN
         tRV4gEsjeU+KPcypT+vEmX+wm7RewfNr23qjHiYfYBSDZDgIm+EgYpEp6RSMvqSvn2M/
         N6yP8wr4J1MXWXgMt7j9sB4NqXeTJx43Pvuz4exlIPQWMwkslKBNPMoEoEPrMu6QTRUp
         6b7z4XdyxD2bTCyS50FGNEftBgivxGF4VRfNC/aFaqzdNSKoVjtN+BxyMm3vn83UK2ya
         1Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684740813; x=1687332813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMo1K3cE4MTtaeyng9kiU/B9LEe1GkpnkCb1adZ6lH8=;
        b=RUxJ7m79XUaU6QAohDRCe/07j56ibXd001W+X+BbPLoSnFKufDqNN9r0Ag+JeJTE15
         Hbm9THpGa86AVbSjgM5UViKnAitsibIJCHPqo4EJN5qvAA8vcdbxac3ySl9WBAQOHI5x
         bYdYXTxLt7njuM9wTBFu52pi1H5JfFNYfhQq1kFSKi/R6Lic4ilMgvjROMSARTQX1QrJ
         W3U4F40hypD3x0IZSC9jLGbROi2Ln8gv1W+up79OXLt/jPTH9oUvPrESlrIsb91IY4Zr
         2oPMQrbCwNcp+fxye7D54PZoNYBf6K6TeWMTO2sKuaEshPgdu4wLI7df31GspCU+pH6q
         3D0w==
X-Gm-Message-State: AC+VfDx2AO2WDxWsvJgL5frBFpl9/d/NjlR2wWf+hQsjFKg8pA0LNll9
	A/ASjss28qzobMu6Yzi/xXsI6n6KiBDaE7p8Gr+qSg==
X-Google-Smtp-Source: ACHHUZ6jWqJZ2+8ysf2EtdgSzoyp3f7AYjzIDstYAbE2lhUxi713z5PtVLJL3s2FZSC3FvvbNe2KzS0hqO1bY0UB9Iw=
X-Received: by 2002:a05:6102:7c9:b0:42f:fc44:be5d with SMTP id
 y9-20020a05610207c900b0042ffc44be5dmr2501294vsg.27.1684740813302; Mon, 22 May
 2023 00:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGj4m+4_yTBONjnS1AihRxFLtt08PMVp_LAjeyz9nDY7OwM+sg@mail.gmail.com>
In-Reply-To: <CAGj4m+4_yTBONjnS1AihRxFLtt08PMVp_LAjeyz9nDY7OwM+sg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 22 May 2023 13:03:22 +0530
Message-ID: <CAFA6WYMOhO-hxraPE9ZsWV6OYS0HVxm5T-oPctEEd9dC3nngXw@mail.gmail.com>
Subject: Re: [meta-arm] setting external-arm-toolchain fails with not cleaned TMPDIR
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 May 2023 07:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4684

On Sat, 20 May 2023 at 15:25, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:
>
> 1. Get Poky and configure qemuarm machine and build
>
>        bitbake linux-libc-headers
>
> 2. Configure 'TCMODE = "external-arm"' as explained in [1], and build
> linux-libc-headers again
>
>        bitbake linux-libc-headers
>
> Problem is that it fails with "The recipe external-arm-toolchain is
> trying to install files into a shared area when those files already
> exist" [2]. This error says that switching DISTRO_FEATURES without a
> cleaned build directory is not supported, but it does not say anything
> about switching TCMODE. Neither,
> https://docs.yoctoproject.org/4.2/ref-manual/variables.html#term-TCMODE
> says something about it.
>
> [1]: https://github.com/jonmason/meta-arm/tree/yocto-4.1/meta-arm-toolchain#pre-built-arm-toolchain-for-linux-development
> [2]:
> ----
> ERROR: external-arm-toolchain-12.2.Rel1-r0 do_packagedata_setscene:
> The recipe external-arm-toolchain is trying to install files into a
> shared area when those files already exist. Those files and their
> manifest location are:
>   .../tmp/pkgdata/qemuarm/runtime/linux-libc-headers
>     (matched in manifest-qemuarm-linux-libc-headers.packagedata)
> ...

This is expected, you have to cleanup the tmpdir and sstate if you
switch the base build toolchain.

-Sumit

> The build has stopped, as continuing in this scenario WILL break
> things - if not now, possibly in the future (we've seen builds fail
> several months later). If the system knew how to recover from this
> automatically it would, however there are several different scenarios
> which can result in this and we don't know which one this is. It may
> be you have switched providers of something like virtual/kernel (e.g.
> from linux-yocto to linux-yocto-dev), in that case you need to execute
> the clean task for both recipes and it will resolve this error. It may
> be you changed DISTRO_FEATURES from systemd to udev or vice versa.
> Cleaning those recipes should again resolve this error, however
> switching DISTRO_FEATURES on an existing build directory is not
> supported - you should really clean out tmp and rebuild (reusing
> sstate should be safe). It could be the overlapping files detected are
> harmless in which case adding them to SSTATE_ALLOW_OVERLAP_FILES may
> be the correct solution. It could also be your build is including two
> different conflicting versions of things (e.g. bluez 4 and bluez 5 and
> the correct solution for that would be to resolve the conflict. If in
> doubt, please ask on the mailing list, sharing the error and filelist
> above.
> ----
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4682): https://lists.yoctoproject.org/g/meta-arm/message/4682
> Mute This Topic: https://lists.yoctoproject.org/mt/99028181/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>


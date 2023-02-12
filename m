Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E61C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 17:27:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.15727.1676222861235302186
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 09:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFenbSme;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 20so8492163oix.5
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 09:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VN0cefs1WnuIuuexnC3TerBpu3RnVLr5uOGehdV6tKU=;
        b=jFenbSmepzysI56N5k/Rsye5hOq+8ow5Uh6nv6KHk0qyXIaVCe3Ho+SUwsnLFR+sps
         D/cZICemgEB1lAEyK2TPODSY72xq0I1fLAnLgL09AnBZ6G9ijlW0ueuo2bjms22QDja9
         2woZUVRfMfSSJt59LdtmGFnnnrP07BXWjsmMyxoQs1VgK/E18jKhFmvVRBWdgv/j70YD
         eUbNh6vf/wpBpFahfkQwU/bCWRqrc+Bwf9mmlwUJFqjncYbagmQ0ZpcURI15HkVkcl08
         BYoQeNMf95CcvApNFeeVCeMV+uU9jtFIU9HwV4Nb1b3HgTrqODFrzfz8owNqF0mNKPyx
         Mctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VN0cefs1WnuIuuexnC3TerBpu3RnVLr5uOGehdV6tKU=;
        b=G84DbSwZA2LFKlvNa1ZO7fkZQDAEg3k8CR4BsLc4L6M5C+y4d+tCaJFPcqYWHh0nl1
         CHZ1C+jVBCAQ0tUnaAXZKj7vxPRN85LE+bY3UAKT+ryBl5CpyrlvP0H80ibQN4uYHPoN
         xQ9leoF4hM7Ej/k2YYCRAeqIy4VgpZWomwHV8505tyj36G4XYRkD8BKtiOPdS/FOAbS9
         3VAByF4j9muPQY36Su/kIx9aR1OizAs6axgLcbjEtDtFzyKBIiy9lDCv2D7hCVjkN1nw
         WmVxgpbR6i+a40/pJnYJIEMcv8pF5vqQAwl0KqjvBaDaMbTRJ3qAFyU89/31p0/NyEoL
         ao3w==
X-Gm-Message-State: AO0yUKVlOVV7PZ9aQbXhMwLomvaZVI7xxchkQUzc+gsIDyYg9FHM52uS
	t3411s7AHsgZWfrAP5G5xDfoOzbxkWwDfjVILaE5+qvv
X-Google-Smtp-Source: AK7set8Y0ITflxsD4DZ1oxfuCvxcuT6k82hY5ebgq8WLtYrNg76ZxShknn1ua5jMj+DoDZuuvM9TfOLpv1TWiuN1Ga4=
X-Received: by 2002:aca:f1c6:0:b0:37b:73fe:e7f6 with SMTP id
 p189-20020acaf1c6000000b0037b73fee7f6mr1216904oih.55.1676222860050; Sun, 12
 Feb 2023 09:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20230212172540.2898451-1-raj.khem@gmail.com>
In-Reply-To: <20230212172540.2898451-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2023 09:27:14 -0800
Message-ID: <CAMKF1srSsZFbQD_W4-aWOUqoKNNfDpphr3mL1YAoo3-bg997yw@mail.gmail.com>
Subject: Re: [PATCH] optee-os: Forward port 0008-no-warn-rwx-segments.patch to 3.19.0
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 17:27:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4381

ignore this patch.

On Sun, Feb 12, 2023 at 9:25 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0008-no-warn-rwx-segments.patch           | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
> index 2dc797b3..5a9bad6d 100644
> --- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
> +++ b/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
> @@ -1,38 +1,36 @@
> -diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
> -index 0e96e606c..3fbcb6804 100644
>  --- a/core/arch/arm/kernel/link.mk
>  +++ b/core/arch/arm/kernel/link.mk
> -@@ -37,6 +37,7 @@ link-ldflags += --sort-section=alignment
> +@@ -25,6 +25,7 @@ link-ldflags += -T $(link-script-pp) -Ma
> + link-ldflags += --sort-section=alignment
>   link-ldflags += --fatal-warnings
>   link-ldflags += --gc-sections
> - link-ldflags += $(link-ldflags-common)
>  +link-ldflags += $(call ld-option,--no-warn-rwx-segments)
>
>   link-ldadd  = $(LDADD)
>   link-ldadd += $(ldflags-external)
> -@@ -61,6 +62,7 @@ link-script-cppflags := \
> +@@ -49,6 +50,7 @@ link-script-cppflags := \
>                 $(cppflagscore))
>
>   ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
>  +                 $(call ld-option,--no-warn-rwx-segments) \
> -                  $(link-ldflags-common) \
>                    $(link-objs) $(link-ldadd) $(libgcccore)
>   cleanfiles += $(link-out-dir)/all_objs.o
> -@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
> + $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
> +@@ -61,7 +63,7 @@ $(link-out-dir)/unpaged_entries.txt: $(l
> +       $(q)$(NMcore) $< | \
>                 $(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
>
> - unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
> --               $(link-ldflags-common)
> -+               $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
> +-unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
> ++unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections $(call ld-option,--no-warn-rwx-segments)
>   unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
>   cleanfiles += $(link-out-dir)/unpaged.o
>   $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
> -@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
> +@@ -89,7 +91,7 @@ $(link-out-dir)/init_entries.txt: $(link
> +       $(q)$(NMcore) $< | \
>                 $(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
>
> - init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
> --             $(link-ldflags-common)
> -+             $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
> +-init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
> ++init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections $(call ld-option,--no-warn-rwx-segments)
>   init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
>               $(libgcccore)
>   cleanfiles += $(link-out-dir)/init.o
> --
> 2.39.1
>


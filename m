Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F23C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 10:16:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.31276.1640254601074769578
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 02:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=JjFDgi+6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id s1so10467541wra.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nvWAGP08xk/vUXM6mZjYOwhhhNI5DfTgMxbQ5RzZAKg=;
        b=JjFDgi+6PDiGEobckS0O0Y0hxZ30/TEX3OWARrymrnB5fb0h2DwM2CWjqQvokh+xaX
         QxaiNvCRvcyX7ds4T1m2LlcqTRDGkmDTi3m2bti8GKoZAC5xB1m+D7PCYCsuCjv70vEQ
         27cDCUhct+reI41uXdoBOhdg1g/4GHovGGmUo0CCvGL/gmHIl7MFIpIcaXAWgJUVuSsw
         j1ltcDiXkog0H0dysq9mOs50rCmlnUL/LN0hrfQ+o7x9DhZL8zN7l0GARRvr5VrmKm+N
         PnCoXVgJkibFNwj0vu8Gmh4OyWmfLV2IXbJn37MH2o3X+zGVkmy55zE2q8Whmyi65nxE
         12LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nvWAGP08xk/vUXM6mZjYOwhhhNI5DfTgMxbQ5RzZAKg=;
        b=jtBcj1N8t7jlsDnOkvAoVlob9xowm3K0jWjdb+gcKu0XyIFietL4eD18TXyCSbt+o8
         Cm0Gqr9ov7XVyxfM0cq0iS+Y20Zhezxe/t6D2zyNvSWQDJXmLdS/fHpZnRMeZ2ZmUBPR
         crZhTT6UhoyJX+UtYhIgMjnZT6JF1oB2qfmhYNfOEmmq15ufZNspFkEH5YhMwdg5C6QM
         mzfLef5jFJ6PB+N+TjS4LOWUhmMXPG3BXGBp9sDnD6379s093MzUD26WzfVlkGNbqW+X
         wTCwPK7/g+H5U6HLmtFqb5b/tdXuolV/USuJyYuKcBrXsKLOUb8I/6R7LoQTfEtcKBGz
         rhqA==
X-Gm-Message-State: AOAM530uap/ovbPLxbTykfT+RrNn0LlRAn02DV7E76cj5qeoOnUKQVcn
	s2SMpQ1NYYoGqX72y46NOKLM1YTcli2Mn2mvDVjGmQ==
X-Google-Smtp-Source: 
 ABdhPJzmOoKpxOPrm+XPer1pAm16oLIMIOIXXe8xts1BqSx5flRijmXaQpQSnqvssH81Rw//QrgADfFwH5ZMh8RBS64=
X-Received: by 2002:a5d:59a8:: with SMTP id p8mr1202314wrr.497.1640254599407;
 Thu, 23 Dec 2021 02:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20211222175717.2459-1-xueliang.zhong@arm.com>
 <20211222175717.2459-2-xueliang.zhong@arm.com>
In-Reply-To: <20211222175717.2459-2-xueliang.zhong@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 23 Dec 2021 10:16:28 +0000
Message-ID: 
 <CAAnfSTuAak+r+DG3bj82Jy8smX+qNqOjh0oBBq9X2=jyNAgo2A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/1]
 corstone1000:efi_loader-Fix-loaded-image-alignment
To: xueliang.zhong@arm.com
Cc: meta-arm@lists.yoctoproject.org, Vishnu Banavath <vishnu.banavath@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Dec 2021 10:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2767

This doesn't work for master:

ERROR: u-boot-1_2021.10-r0 do_patch: Applying patch
'0049-efi_loader-Fix-loaded-image-alignment.patch' on target directory
'/yocto/ross/kas-tmp/work/corstone1000_fvp-poky-linux/u-boot/1_2021.10-r0/g=
it'
Applying patch 0049-efi_loader-Fix-loaded-image-alignment.patch
patching file include/efi_loader.h
Hunk #1 succeeded at 677 with fuzz 2 (offset 89 lines).
patching file lib/efi_loader/efi_image_loader.c
Hunk #1 FAILED at 880.
Hunk #2 FAILED at 896.
2 out of 2 hunks FAILED -- rejects in file lib/efi_loader/efi_image_loader.=
c
patching file lib/efi_loader/efi_memory.c
Hunk #1 succeeded at 549 (offset 1 line).
Patch 0049-efi_loader-Fix-loaded-image-alignment.patch does not apply
(enforce with -f)

Ross

On Wed, 22 Dec 2021 at 17:57, <xueliang.zhong@arm.com> wrote:
>
> From: Vishnu Banavath <vishnu.banavath@arm.com>
>
> This patch is cherry-picked from upstream to fix misalignment
> of efi load image
>
> Change-Id: I6c9582b4673009e8b5e2364c5e1cc1213d58a451
> Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
> ---
>  ...fi_loader-Fix-loaded-image-alignment.patch | 132 ++++++++++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
>  2 files changed, 133 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-efi_loader-Fix-loaded-image-alignment.patch
>
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi=
_loader-Fix-loaded-image-alignment.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0049-efi_loader-Fix-loaded-image-alignment.patch
> new file mode 100644
> index 0000000..f287ec8
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi_loader=
-Fix-loaded-image-alignment.patch
> @@ -0,0 +1,132 @@
> +Upstream-Status: Backport [ebdea88d57d5e67b8f6e6cf615300eedbc7200a9]
> +Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
> +
> +From faa6716a42486014486f6a6376d04fd83214e554 Mon Sep 17 00:00:00 2001
> +From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> +Date: Mon, 11 Oct 2021 15:10:23 +0300
> +Subject: [PATCH] efi_loader: Fix loaded image alignment
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We are ignoring the alignment communicated via the PE/COFF header.
> +Starting 5.10 the Linux kernel will loudly complain about it. For more
> +details look at [1] (in linux kernel).
> +
> +So add a function that can allocate aligned EFI memory and use it for ou=
r
> +relocated loaded image.
> +
> +[1] c32ac11da3f83 ("efi/libstub: arm64: Double check image alignment at =
entry")
> +
> +Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> +Tested-by: Vincent Stehl=C3=A9 <vincent.stehle@arm.com>
> +Acked-by: Ard Biesheuvel <ardb@kernel.org>
> +Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> +
> +diff --git a/include/efi_loader.h b/include/efi_loader.h
> +index 676b03aa07..c3e6a36def 100644
> +--- a/include/efi_loader.h
> ++++ b/include/efi_loader.h
> +@@ -588,6 +588,8 @@ struct efi_device_path *efi_get_dp_from_boot(const e=
fi_guid_t guid);
> + #define efi_size_in_pages(size) (((size) + EFI_PAGE_MASK) >> EFI_PAGE_S=
HIFT)
> + /* Generic EFI memory allocator, call this to get memory */
> + void *efi_alloc(uint64_t len, int memory_type);
> ++/* Allocate pages on the specified alignment */
> ++void *efi_alloc_aligned_pages(u64 len, int memory_type, size_t align);
> + /* More specific EFI memory allocator, called by EFI payloads */
> + efi_status_t efi_allocate_pages(int type, int memory_type, efi_uintn_t =
pages,
> +                               uint64_t *memory);
> +diff --git a/lib/efi_loader/efi_image_loader.c b/lib/efi_loader/efi_imag=
e_loader.c
> +index a0eb63fceb..c6094eb423 100644
> +--- a/lib/efi_loader/efi_image_loader.c
> ++++ b/lib/efi_loader/efi_image_loader.c
> +@@ -880,8 +880,9 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj=
 *handle,
> +               image_base =3D opt->ImageBase;
> +               efi_set_code_and_data_type(loaded_image_info, opt->Subsys=
tem);
> +               handle->image_type =3D opt->Subsystem;
> +-              efi_reloc =3D efi_alloc(virt_size,
> +-                                    loaded_image_info->image_code_type)=
;
> ++              efi_reloc =3D efi_alloc_aligned_pages(virt_size,
> ++                                                  loaded_image_info->im=
age_code_type,
> ++                                                  opt->SectionAlignment=
);
> +               if (!efi_reloc) {
> +                       log_err("Out of memory\n");
> +                       ret =3D EFI_OUT_OF_RESOURCES;
> +@@ -896,8 +897,9 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj=
 *handle,
> +               image_base =3D opt->ImageBase;
> +               efi_set_code_and_data_type(loaded_image_info, opt->Subsys=
tem);
> +               handle->image_type =3D opt->Subsystem;
> +-              efi_reloc =3D efi_alloc(virt_size,
> +-                                    loaded_image_info->image_code_type)=
;
> ++              efi_reloc =3D efi_alloc_aligned_pages(virt_size,
> ++                                                  loaded_image_info->im=
age_code_type,
> ++                                                  opt->SectionAlignment=
);
> +               if (!efi_reloc) {
> +                       log_err("Out of memory\n");
> +                       ret =3D EFI_OUT_OF_RESOURCES;
> +diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
> +index be2f655dff..e0640323bc 100644
> +--- a/lib/efi_loader/efi_memory.c
> ++++ b/lib/efi_loader/efi_memory.c
> +@@ -548,6 +548,58 @@ efi_status_t efi_free_pages(uint64_t memory, efi_ui=
ntn_t pages)
> +       return ret;
> + }
> +
> ++/**
> ++ * efi_alloc_aligned_pages - allocate
> ++ *
> ++ * @len:              len in bytes
> ++ * @memory_type:      usage type of the allocated memory
> ++ * @align:            alignment in bytes
> ++ * Return:            aligned memory or NULL
> ++ */
> ++void *efi_alloc_aligned_pages(u64 len, int memory_type, size_t align)
> ++{
> ++      u64 req_pages =3D efi_size_in_pages(len);
> ++      u64 true_pages =3D req_pages + efi_size_in_pages(align) - 1;
> ++      u64 free_pages;
> ++      u64 aligned_mem;
> ++      efi_status_t r;
> ++      u64 mem;
> ++
> ++      /* align must be zero or a power of two */
> ++      if (align & (align - 1))
> ++              return NULL;
> ++
> ++      /* Check for overflow */
> ++      if (true_pages < req_pages)
> ++              return NULL;
> ++
> ++      if (align < EFI_PAGE_SIZE) {
> ++              r =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES, memory_t=
ype,
> ++                                     req_pages, &mem);
> ++              return (r =3D=3D EFI_SUCCESS) ? (void *)(uintptr_t)mem : =
NULL;
> ++      }
> ++
> ++      r =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES, memory_type,
> ++                             true_pages, &mem);
> ++      if (r !=3D EFI_SUCCESS)
> ++              return NULL;
> ++
> ++      aligned_mem =3D ALIGN(mem, align);
> ++      /* Free pages before alignment */
> ++      free_pages =3D efi_size_in_pages(aligned_mem - mem);
> ++      if (free_pages)
> ++              efi_free_pages(mem, free_pages);
> ++
> ++      /* Free trailing pages */
> ++      free_pages =3D true_pages - (req_pages + free_pages);
> ++      if (free_pages) {
> ++              mem =3D aligned_mem + req_pages * EFI_PAGE_SIZE;
> ++              efi_free_pages(mem, free_pages);
> ++      }
> ++
> ++      return (void *)(uintptr_t)aligned_mem;
> ++}
> ++
> + /**
> +  * efi_allocate_pool - allocate memory from pool
> +  *
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index 4e30356..51973dd 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -58,6 +58,7 @@ SRC_URI:append:corstone1000 =3D " \
>        file://0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.p=
atch \
>        file://0047-efi_firmware-add-get_image_info-for-corstone1000.patch=
 \
>        file://0048-corstone1000-enable-ethernet-device.patch \
> +      file://0049-efi_loader-Fix-loaded-image-alignment.patch \
>        "
>
>  #
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2762): https://lists.yoctoproject.org/g/meta-arm/mess=
age/2762
> Mute This Topic: https://lists.yoctoproject.org/mt/87903067/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burton=
ini.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


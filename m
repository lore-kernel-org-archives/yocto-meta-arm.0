Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3338DC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 11:42:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.14338.1647171746631730285
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 13 Mar 2022 04:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=LSSPLCg6;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so7990412wmf.0
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 13 Mar 2022 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lDP/+WW9YarEqRFzZRvjabNPESsnV6Cr6ZRRhvPPtGg=;
        b=LSSPLCg65YpZ4+DQYIy70Yj2MEyJOCEF5PBe9qVtsKfYhHfBY71bb0NfvpSi7hAHDI
         WWw9vHoiKvkyQlrp9CutUMFwNGk0AkjptwBLhvj4TZrHHO7ojTTqf+80evwLw5835844
         PTvsGWZCQUJvznTydczXhNRIc5VEuyKu3j7pxa10bSM2FUF5nQ/iA5qf0ILTHunXvegl
         M3HUS+UY7PjjqnGl7s9QdROMOyeKN6clmsDFElITdLPwjqq0adhYTyUDSfigwQQBZtX4
         oiVZ39m5BSTu6oLiYJ5xOz4Zm8zbfsjV4mkdCuxMkbxJqEfeQRPzV2bpuM+RjICAbod+
         jemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lDP/+WW9YarEqRFzZRvjabNPESsnV6Cr6ZRRhvPPtGg=;
        b=gP5/Kqluz/XBLlFk7+VKNJXVkCxFHbhvMW/hx8WJN9s5njlaio8tDW3hHe13FwG23u
         BnivEo0gyM31XeQl5qcg7A1YKDf7IAZwDud/k69EfkWVjH+3lccORdh8pEqso3i2xwLw
         sg/fIR/TxIRMvONlB1DeaOss2kvaKVdV9TcAAMS2YBjvK8+yrZxxOc3AQIGa5PwvkZxO
         ptXYc3za1Txluj6gNUpWjj9M8ntOeJr1Vi/mFBc/V7HdKBdpeDrBA/N9ubeO8HWVox7O
         shoJlH//oZFTel4q/0eENn4E0KkYAP58NYdsuZKam1MCvVK9BUsFAjQRsw45iHOBH+Pq
         +zpA==
X-Gm-Message-State: AOAM532eJqjzMESJ4DnS8L6IVwovZ1xcwy1k/4ORLFD7sBfx9KEKQtPj
	liKsda6EoXgYE6SG/CQUeRiN7yXQq//ri7tMb7pMOg==
X-Google-Smtp-Source: 
 ABdhPJwATiAUr+SQoZfSHD7tsl2KumCNnCYmqnar9RQjuPXfF5RjyH3+QweP7H4xKyWAqKVVFKU2K8YKOIDcFnwgUXI=
X-Received: by 2002:a05:600c:4b86:b0:385:2800:2915 with SMTP id
 e6-20020a05600c4b8600b0038528002915mr23014029wmp.117.1647171744541; Sun, 13
 Mar 2022 04:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220311140814.3406439-1-ross.burton@arm.com>
 <20220311171614.GA1766@denix.org>
In-Reply-To: <20220311171614.GA1766@denix.org>
From: Ross Burton <ross@burtonini.com>
Date: Sun, 13 Mar 2022 11:42:13 +0000
Message-ID: 
 <CAAnfSTvAcJ-8o0pDGMV9AzF-FSmbUWq+1v6m6jhkB=hq2kDdVA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/edk2-firmware: upgrade to 202222
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 13 Mar 2022 11:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3167

Too many damn twos and zeros! Thanks for noticing,
Ross

On Fri, 11 Mar 2022 at 17:16, Denys Dmytriyenko <denis@denix.org> wrote:
>
> Is it 202222 or 202202?
>
> On Fri, Mar 11, 2022 at 02:08:14PM +0000, Ross Burton wrote:
> > Drop 0001-Fix-VLA-parameter-warning.patch, this is merged upstream.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 -
> >  .../recipes-bsp/uefi/edk2-firmware_202111.bb  |  4 --
> >  .../recipes-bsp/uefi/edk2-firmware_202202.bb  |  4 ++
> >  .../0001-Fix-VLA-parameter-warning.patch      | 44 -----------------
> >  .../recipes-bsp/uefi/files/unaligned.patch    | 48 ++++++++-----------
> >  meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb     |  2 +-
> >  6 files changed, 26 insertions(+), 77 deletions(-)
> >  delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
> >  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
> >  delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parame=
ter-warning.patch
> >
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/rec=
ipes-bsp/uefi/edk2-firmware.inc
> > index dc561eef..a653d295 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -16,7 +16,6 @@ EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocor=
e/edk2-platforms.git;branch=3Dm
> >  SRC_URI =3D "\
> >      ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
> >      ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/=
edk2-platforms;nobranch=3D1 \
> > -    file://0001-Fix-VLA-parameter-warning.patch \
> >      file://unaligned.patch \
> >  "
> >
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb b/meta-a=
rm/recipes-bsp/uefi/edk2-firmware_202111.bb
> > deleted file mode 100644
> > index bc027ef7..00000000
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -SRCREV_edk2           ?=3D "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
> > -SRCREV_edk2-platforms ?=3D "3e73df15730667c46a1e449cca872e7f8861007c"
> > -
> > -require edk2-firmware.inc
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb b/meta-a=
rm/recipes-bsp/uefi/edk2-firmware_202202.bb
> > new file mode 100644
> > index 00000000..441805e3
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
> > @@ -0,0 +1,4 @@
> > +SRCREV_edk2           ?=3D "b24306f15daa2ff8510b06702114724b33895d3c"
> > +SRCREV_edk2-platforms ?=3D "c9e377b00fc086fcb5a5b41663a0149bde9bcc2e"
> > +
> > +require edk2-firmware.inc
> > diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-war=
ning.patch b/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning=
.patch
> > deleted file mode 100644
> > index 66dede8f..00000000
> > --- a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.pa=
tch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
> > -From: Adrian Herrera <adr.her.arc.95@gmail.com>
> > -Date: Mon, 22 Mar 2021 21:06:47 +0000
> > -Subject: [PATCH] Fix VLA parameter warning
> > -
> > -Make VLA buffer types consistent in declarations and definitions.
> > -Resolves build crash when using -Werror due to "vla-parameter" warning=
.
> > -
> > -Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
> > -Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
> > ----
> > - c/dec/decode.c | 6 ++++--
> > - c/enc/encode.c | 5 +++--
> > - 2 files changed, 7 insertions(+), 4 deletions(-)
> > -
> > ---- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
> > -+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
> > -@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErro
> > - }
> > -
> > - BrotliDecoderResult BrotliDecoderDecompress(
> > --    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decod=
ed_size,
> > --    uint8_t* decoded_buffer) {
> > -+    size_t encoded_size,
> > -+    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
> > -+    size_t* decoded_size,
> > -+    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
> > -   BrotliDecoderState s;
> > -   BrotliDecoderResult result;
> > -   size_t total_out =3D 0;
> > ---- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
> > -+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
> > -@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
> > -
> > - BROTLI_BOOL BrotliEncoderCompress(
> > -     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size=
,
> > --    const uint8_t* input_buffer, size_t* encoded_size,
> > --    uint8_t* encoded_buffer) {
> > -+    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
> > -+    size_t* encoded_size,
> > -+    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
> > -   BrotliEncoderState* s;
> > -   size_t out_size =3D *encoded_size;
> > -   const uint8_t* input_start =3D input_buffer;
> > diff --git a/meta-arm/recipes-bsp/uefi/files/unaligned.patch b/meta-arm=
/recipes-bsp/uefi/files/unaligned.patch
> > index 1930f4c7..fa13956f 100644
> > --- a/meta-arm/recipes-bsp/uefi/files/unaligned.patch
> > +++ b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
> > @@ -1,27 +1,21 @@
> > -Latest clang is causing build failures because -Werror is used:
> > -
> > -  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
> > -  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned th=
an 'EFI_GUID'
> > -  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which c=
an lead to
> > -  unaligned accesses [-Werror,-Wunaligned-access]
> > -
> > -This has been reported upstream[1] so until this is resolved, ignore t=
he warnings.
> > -
> > -[1] https://edk2.groups.io/g/devel/message/86838
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_=
def.template
> > -index 2e6b382ab6..75bfbc5ae6 100755
> > ---- a/BaseTools/Conf/tools_def.template
> > -+++ b/BaseTools/Conf/tools_def.template
> > -@@ -2566,7 +2566,7 @@ DEFINE CLANG38_X64_PREFIX           =3D ENV(CLAN=
G38_BIN)
> > - DEFINE CLANG38_IA32_TARGET          =3D -target i686-pc-linux-gnu
> > - DEFINE CLANG38_X64_TARGET           =3D -target x86_64-pc-linux-gnu
> > -
> > --DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wn=
o-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno=
-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-op=
tion
> > -+DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wn=
o-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno=
-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-op=
tion -Wno-error=3Dunaligned-access
> > - DEFINE CLANG38_ALL_CC_FLAGS         =3D DEF(GCC48_ALL_CC_FLAGS) DEF(C=
LANG38_WARNING_OVERRIDES) -fno-stack-protector -mms-bitfields -Wno-address =
-Wno-shift-negative-value -Wno-unknown-pragmas -Wno-incompatible-library-re=
declaration -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -msoft-float =
-mno-implicit-float  -ftrap-function=3Dundefined_behavior_has_been_optimize=
d_away_by_clang -funsigned-char -fno-ms-extensions -Wno-null-dereference
> > -
> > - ###########################
> > +Latest clang is causing build failures because -Werror is used:
> > +
> > +  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
> > +  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned th=
an 'EFI_GUID'
> > +  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which c=
an lead to
> > +  unaligned accesses [-Werror,-Wunaligned-access]
> > +
> > +This has been reported upstream[1] so until this is resolved, ignore t=
he warnings.
> > +
> > +[1] https://edk2.groups.io/g/devel/message/86838
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_=
def.template
> > +index f2bb6247e8..ca2b449f0a 100755
> > +--- a/BaseTools/Conf/tools_def.template
> > ++++ b/BaseTools/Conf/tools_def.template
> > +@@ -2570 +2570 @@ DEFINE CLANG38_X64_TARGET           =3D -target x86_=
64-pc-linux-gnu
> > +-DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wn=
o-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno=
-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-op=
tion -Wno-unused-but-set-variable -Wno-unused-const-variable
> > ++DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wn=
o-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno=
-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-op=
tion -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-error=3Du=
naligned-access
> > diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_3.1.bb
> > index fabeeaef..83852d0a 100644
> > --- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
> > +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
> > @@ -1,4 +1,4 @@
> > -require recipes-bsp/uefi/edk2-firmware_202111.bb
> > +require recipes-bsp/uefi/edk2-firmware_202202.bb
> >
> >  LICENSE +=3D "& Apache-2.0"
> >  LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md=
;md5=3D2a944942e1496af1886903d274dedb13"
> > --
> > 2.25.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3155): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/3155
> > Mute This Topic: https://lists.yoctoproject.org/mt/89710722/3617104
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [denis@den=
ix.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5DEC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:35:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.11732.1685979296966600272
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 08:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@theyoctojester-info.20221208.gappssmtp.com header.s=20221208 header.b=wFmymc6n;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.44, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5147dce372eso7292296a12.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20221208.gappssmtp.com; s=20221208; t=1685979295; x=1688571295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=10UoIkPkuSi7+QMHw2/zjsWxnRoaV0KO/edh+REdTsg=;
        b=wFmymc6nWnvd+2dsNrPOhrNdQD4XF2HbijSt0f4+wxqj43mSc9j3AF/a1OTTiagYRF
         fxcdZILhb9mu13Gp5cQPJelkP+70mhqsqcbEzCcJQoVzCpGwx9wrCCtUtkskfobh9G2W
         h0vrUQSHBYoDivdOPQyxqpXegS8/8IVHajJsjMGSGtrU7+uU5pMaUZbDZzBG5OeN9EoO
         rZ9E12K/F/KgvcDcUO6tKNQO2KGC56pUe3h7CR+zf6Hnw+wyGDHnm5wIggHKqQ/BGyxs
         9MP0vOn7tDpn6+PojOGMSeh3gLX6Gt0z0c84juHr+uV5UFQRVxlQXUrX/vRt+I7blC3j
         Bdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979295; x=1688571295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10UoIkPkuSi7+QMHw2/zjsWxnRoaV0KO/edh+REdTsg=;
        b=e6xCFOFiyXE/25i23frd7nNeovdlJey5zyF0LggYiFz1zKyPhFNX6XFkWanu/UEGiv
         //cn4bjBHcHLjIQRLDZmpHlSG60XKTeMfdmYkOdM90v+c2aZTAI3X+RJXJIQFkONLg78
         xqQ9IwGgiXC4ddKK6Zbq+dpShZNwUKBHzZtS0fQHO+3aWQN9hQZ6aKM16L9n+J6wI002
         +6kDO8j17E41UnKCDl3WtagC9ILOvx6+oaXgrDqfgY7+G2HOJkwr2eG7OA92vszY1dpP
         hzaDfr0y5yrhEaEpP41wQIM28dipHrFqw2wGJttSr6r8y0U2HEQLXpCLzzcYzdxCoXex
         rhBg==
X-Gm-Message-State: AC+VfDxPX9r884/cXJdBukRfnnptY+6V4MJEoILmin0LzmRso3Qir2ta
	DKhf/JLESgGT+5a9hYuOx1BljIfuYNtU8AT1w2PGgw==
X-Google-Smtp-Source: ACHHUZ71O2arGKroXtCrjekiHlxb/1xyTdEuHipW/ySX6mHbXuB7Cw4Q4L1Qzm1CLROIboFtUeJgP2fVZ5xwony9qBs=
X-Received: by 2002:a05:6402:7cb:b0:514:80ba:4be8 with SMTP id
 u11-20020a05640207cb00b0051480ba4be8mr8513293edy.31.1685979295379; Mon, 05
 Jun 2023 08:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us> <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
 <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
In-Reply-To: <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Mon, 5 Jun 2023 17:34:29 +0200
Message-ID: <CAEt6NwqvRqZbG0eZhGHpN6HJZjLN44R4xsDuOXd6QTw+oD01Xg@mail.gmail.com>
Subject: Re: [meta-arm] Help to boot QEMU ARM64 UEFI
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000003b805fd63a509"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 15:35:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4726

--0000000000000003b805fd63a509
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

there is a qemuarm64+UEFI-based demo setup in
https://github.com/mendersoftware/meta-mender-community/tree/kirkstone/meta=
-mender-qemu-community.
You can just leave out the Mender bits if you don't want/need them and
should be good to go, I think.

Greetz,
Josef

On Mon, Jun 5, 2023 at 9:38=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:

> Hi,
>
> On Fri, 28 Oct 2022 at 22:00, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
> >
> > Hi Jon,
> >
> > On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Dear Meta-arm Maintainers/Contributors,
> > > >
> > > > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid o=
f
> > > > emulation on Apple Silicon).
> > > >
> > > > I'm really noob at UEFI and was used to boot my ARM devices using
> > > > u-boot but to keep coherency with other QEMU machines x86-64, I wou=
ld
> > > > like to have a bootflow like this:
> > > > OVMF -> GRUB -> Kernel
> > > >
> > > > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > > >
> https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uef=
i
> > > >
> > > > Then i'm booting my qemu machine like this:
> > > > ----
> > > > qemu-system-aarch64 \
> > > >   -machine virt \
> > > >   -name "Virtual ARM64" \
> > > >   -m 4G \
> > > >   -smp 6 \
> > > >   -cpu cortex-a57 \
> > > >   -drive
> file=3D./core-image-minimal-qemuarm64-efi.uefiimg,if=3Dvirtio,format=3Dra=
w\
> > > >   -bios ./QEMU_EFI.fd \
> > > >   -nographic
> > > > ----
> > > >
> > > > The output seems stuck after Grub and never properly jump into the
> kernel
> > > >
> > > > ----
> > > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from
> PciRoot(0x0)/Pci(0x2,0x0)
> > > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from
> PciRoot(0x0)/Pci(0x2,0x0)
> > > > Welcome to GRUB!
> > > >
> > > >
> > > >
> > > > EFI stub: Booting Linux Kernel...
> > > > EFI stub: Using DTB from configuration table
> > > > EFI stub: Exiting boot services and installing virtual address map.=
..
> > > > ----
> > > >
> > > > Did I miss something in my kernel configuration?
>
> I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and
> meta-arm and now I have the exact same problem.
>
> I have still the same patch applied and check that the cfg/efi.scc is
> properly applied but doesn't succeed to boot.
>
> I have tried with the previous grub and with the new one and both
> failed so it seems more related to linux kernel.
>
> I have tried to enable EFI_EARLYCON + append to cmdline
> "earlycon=3Dpl011,0x9000000" same print. I'm not sure at all about
> this...
>
> Do you know if there is a new CONFIG to enable?
>
> Thanks in advance,
> Regards,
> Clement
>
>
> > >
> > >
> > > qemuarm64 and efi/edk2 generally works and we test it every night
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> > >
> > > meta-arm does have the following we are adding
> > > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> > >
> > > I do have a patch out to the yocto linux kernel recipe that has a
> > > config fragment that might be missing for your setup (in place of the
> > > above).
> > >
> https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmaso=
n@kudzu.us/T/
> > > That patch has been accepted, but might not be in your tree (dependin=
g
> > > on what version you are running).
> >
> > Correct, patch applied and now it works :)
> >
> > Thank you for taking the time to answer my question.
> > Regards,
> > Clement
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > >
> > > >
> > > > Thanks for your help
> > > > Regards,
> > > > Clement
> > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> You automatically follow any topics you start or reply to.
> View/Reply Online (#4721):
> https://lists.yoctoproject.org/g/meta-arm/message/4721
> Mute This Topic: https://lists.yoctoproject.org/mt/94625180/4689568
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> jester@theyoctojester.info]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000003b805fd63a509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Clement,<div><br></div><div>there is a qemuarm64+UEFI-b=
ased demo setup in=C2=A0<a href=3D"https://github.com/mendersoftware/meta-m=
ender-community/tree/kirkstone/meta-mender-qemu-community">https://github.c=
om/mendersoftware/meta-mender-community/tree/kirkstone/meta-mender-qemu-com=
munity</a>. You can just leave out the Mender bits if you don&#39;t want/ne=
ed them and should be good to go, I think.</div><div><br></div><div>Greetz,=
</div><div>Josef</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Jun 5, 2023 at 9:38=E2=80=AFAM Cl=C3=A9ment P=
=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i,<br>
<br>
On Fri, 28 Oct 2022 at 22:00, Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto=
:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Hi Jon,<br>
&gt;<br>
&gt; On Fri, 28 Oct 2022 at 16:10, Jon Mason &lt;<a href=3D"mailto:jdmason@=
kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:<br>
&gt; &gt; &gt; Dear Meta-arm Maintainers/Contributors,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m trying to boot a qemuarm64 machine with UEFI boot (t=
o get rid of<br>
&gt; &gt; &gt; emulation on Apple Silicon).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m really noob at UEFI and was used to boot my ARM devi=
ces using<br>
&gt; &gt; &gt; u-boot but to keep coherency with other QEMU machines x86-64=
, I would<br>
&gt; &gt; &gt; like to have a bootflow like this:<br>
&gt; &gt; &gt; OVMF -&gt; GRUB -&gt; Kernel<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I got the OVMF firmware from EDK2-firmware recipe on meta-ar=
m:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/jonmason/meta-arm/tree/master/=
meta-arm/recipes-bsp/uefi" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uefi</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Then i&#39;m booting my qemu machine like this:<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; qemu-system-aarch64 \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-machine virt \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-name &quot;Virtual ARM64&quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-m 4G \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-smp 6 \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-cpu cortex-a57 \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-drive file=3D./core-image-minimal-qemuarm64-efi=
.uefiimg,if=3Dvirtio,format=3Draw\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-bios ./QEMU_EFI.fd \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0-nographic<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The output seems stuck after Grub and never properly jump in=
to the kernel<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; BdsDxe: failed to load Boot0001 &quot;UEFI Misc Device&quot;=
 from<br>
&gt; &gt; &gt; VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found<br=
>
&gt; &gt; &gt; BdsDxe: loading Boot0002 &quot;UEFI Misc Device 2&quot; from=
 PciRoot(0x0)/Pci(0x2,0x0)<br>
&gt; &gt; &gt; BdsDxe: starting Boot0002 &quot;UEFI Misc Device 2&quot; fro=
m PciRoot(0x0)/Pci(0x2,0x0)<br>
&gt; &gt; &gt; Welcome to GRUB!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; EFI stub: Booting Linux Kernel...<br>
&gt; &gt; &gt; EFI stub: Using DTB from configuration table<br>
&gt; &gt; &gt; EFI stub: Exiting boot services and installing virtual addre=
ss map...<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Did I miss something in my kernel configuration?<br>
<br>
I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and<br>
meta-arm and now I have the exact same problem.<br>
<br>
I have still the same patch applied and check that the cfg/efi.scc is<br>
properly applied but doesn&#39;t succeed to boot.<br>
<br>
I have tried with the previous grub and with the new one and both<br>
failed so it seems more related to linux kernel.<br>
<br>
I have tried to enable EFI_EARLYCON + append to cmdline<br>
&quot;earlycon=3Dpl011,0x9000000&quot; same print. I&#39;m not sure at all =
about<br>
this...<br>
<br>
Do you know if there is a new CONFIG to enable?<br>
<br>
Thanks in advance,<br>
Regards,<br>
Clement<br>
<br>
<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; qemuarm64 and efi/edk2 generally works and we test it every night=
<br>
&gt; &gt; <a href=3D"https://gitlab.com/jonmason00/meta-arm/-/jobs/32410226=
80" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jonmason00/meta=
-arm/-/jobs/3241022680</a><br>
&gt; &gt;<br>
&gt; &gt; meta-arm does have the following we are adding<br>
&gt; &gt; meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg<br>
&gt; &gt;<br>
&gt; &gt; I do have a patch out to the yocto linux kernel recipe that has a=
<br>
&gt; &gt; config fragment that might be missing for your setup (in place of=
 the<br>
&gt; &gt; above).<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/openembedded-core/202210030049=
59.1317009-1-jdmason@kudzu.us/T/" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmason@kudz=
u.us/T/</a><br>
&gt; &gt; That patch has been accepted, but might not be in your tree (depe=
nding<br>
&gt; &gt; on what version you are running).<br>
&gt;<br>
&gt; Correct, patch applied and now it works :)<br>
&gt;<br>
&gt; Thank you for taking the time to answer my question.<br>
&gt; Regards,<br>
&gt; Clement<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Jon<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for your help<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Clement<br>
&gt; &gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
You automatically follow any topics you start or reply to.<br>
View/Reply Online (#4721): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/4721" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/4721</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94625180/4689=
568" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94625180/4689568</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:jester@theyoctojester.info" target=3D"_blank=
">jester@theyoctojester.info</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000003b805fd63a509--


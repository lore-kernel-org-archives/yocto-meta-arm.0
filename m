Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.5304.1584000722411315183
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Mar 2020 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Cn7UChLQ;
 spf=pass (domain: linaro.org, ip: 209.85.161.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f50.google.com with SMTP id x184so4745974ywd.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 12 Mar 2020 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qENNl9ZQQROsjxLajewtrWnX5ilRT/oJnJ8sT3U75Js=;
        b=Cn7UChLQ6pAHcy1SInR20hS4/NmbEtWvXzF9Ok4oIOjL5LWSVtGEueWGewVIcZZWlY
         xk3ZIkIdXaL6cv1ZYEARPvaDsDhFcZpVP9jnhhYWrbp7ZHSKTP4GBPa6GlLUlxbwq79l
         VDMy521+aATdzZWZJVLZIHegrkQU+f+dtQS6nv/iwlZRJcebyFYavFh8/zKOeSYkutbn
         SwJSfmR5QryToGKZJYnQvZfn1dcwuPbqHfDQRDSJ+EUlyF9om5qaUnP39ITA7yhxNK7O
         1evR4IX+HXIijaVxn5DMaXU5JjePC7wlbYc+/y65i7RaQvHDJpoMJaIlwMQFWARHrH71
         EjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qENNl9ZQQROsjxLajewtrWnX5ilRT/oJnJ8sT3U75Js=;
        b=uY4VbtF63MFBtt65ZzipdJBivl6eYRsGI+VXAxX4LzpIh2+esMnjn6HVa3omE5071w
         K5c6JM1oJgYKwr8WaS2S0CqBABqa2vRJ1qdW3WS8Xm7aHdphnlMM1OwpaUk6cqU8LvWm
         RG6UYqEpTxkmfz+Ur74YDdqiKu+rl6zlFVUPQKjyZPUegLY3sat0Ltj63L7tV3QCadKz
         GyK0xiSpLTzJ7a1V6+YSsgdfTcLwPCk0aioC7qQTW6lF0WtFXI55KwCDWfvKEIzrmhYS
         Gy6ZJebS/736tbuAVOKmDIOQ15uWEB+ci+uwE2C7aoKEXKSvNWiirGZwLcbSZtbGbIpe
         5kjw==
X-Gm-Message-State: ANhLgQ0U+gs69rIY6kaKVylaDD8Ndm/nLW157AJF09LxF+3JugeMsve+
	KZv42JXakWnliwkmwkQasdzBYSVqvIBkFhYMd9tEUw==
X-Google-Smtp-Source: ADFU+vuG9OowXx6wgiSZ6KRRYCQHWJCb6LCCi+fLGgirZQRp2qXW6lA4FveJt3idyGoePMsRZ+4G/WZsBaeQiN0cb/c=
X-Received: by 2002:a25:f201:: with SMTP id i1mr7502052ybe.371.1584000721418;
 Thu, 12 Mar 2020 01:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200311105643.159467-1-rui.silva@arm.com> <20200311105643.159467-2-rui.silva@arm.com>
 <CAP71WjwuG4saWcZSvYxGxxpQ3_c2OEVhmg+AEwWGbn6wQpw4uA@mail.gmail.com> <20200311154550.tgm2itol32jpsxh6@arch-thunder.localdomain>
In-Reply-To: <20200311154550.tgm2itol32jpsxh6@arch-thunder.localdomain>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 12 Mar 2020 09:11:49 +0100
Message-ID: <CAP71WjweYCKx42HtMVuerxE_hBGHzq7J_46kK6056itQJFhSgQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: add upstream kernel inc and v5.3 recipe
To: Rui Miguel Silva <rui.silva@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000530b7105a0a3e8d7"

--000000000000530b7105a0a3e8d7
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 4:46 PM Rui Miguel Silva <rui.silva@arm.com> wrote:

> Hi Nicho,
> thanks for the review.
>
> On Wed, Mar 11, 2020 at 12:06:34PM +0100, Nicolas Dechesne wrote: [--
> Type: text/plain; charset=UTF-8, Encoding: 7bit, Size: 3.3K --]
> > On Wed, Mar 11, 2020 at 11:57 AM Rui Miguel Silva
> > <rui.silva@arm.com> wrote:
> >
> > > From: Rui Silva <rui.silva@arm.com>
> > >
> > > Add support to build using the upstream (Linus tree) and as first
> > > user add recipe for v5.3, which will be later.
> > >
> > > Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb
> > > Signed-off-by: Rui Miguel Silva <rui.silva@arm.com> ---
> > > .../linux/linux-upstream-arm-platforms.inc    | 24
> > > +++++++++++++++++++ .../linux/linux-upstream-arm_5.3.bb
> > > |  8 +++++++
> > >  2 files changed, 32 insertions(+) create mode 100644
> > >    meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > >    create mode 100644 meta-arm-bsp/recipes-kernel/linux/
> > >    linux-upstream-arm_5.3.bb
> > >
> > > diff --git
> > > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > > new file mode 100644 index 000000000000..7b73e7536d19 ---
> > > /dev/null +++
> > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > > @@ -0,0 +1,24 @@ +DESCRIPTION = "Linux Kernel based on upstream
> > > tree" +SECTION = "kernel" +LICENSE = "GPLv2" +SRCREV_FORMAT =
> > > "kernel" + +require recipes-kernel/linux/linux-yocto.inc +
> > > +KERNEL_VERSION_SANITY_SKIP = "1" + +S = "${WORKDIR}/git" + +#
> > > Override do_kernel_configme to avoid kernel being assembled into a
> > > linux-yocto +# style kernel +#
> > >
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-tasks-kernel_configme
> > > +do_kernel_configme[noexec] = "1"
> > >
> >
> > What are the benefits of using linux-yocto when building an upstream
> > kernel? Most BSP typically define their own linux.inc file and
> > do_configure task. I am curious about your approach here, since I
> > haven't seen that before.
>
> The original idea was to use as much as possible the linux-yocto
> existing infrastructure and disable what we did not needed, but your
> approach also makes sense.
>
> For you this is a shipstoper? or can we go like this and change this
> in a follow up patch?  What I really want is to have as much as
> possible with sync with the existing recipes, and when we swap to the
> ones in this meta-arm then cleanup any notes.
>

again.. it's just my thoughts on this, and what came to my mind when I
looked at your patch. But to me, we should either use linux-yocto (e.g.
kernel-yocto.bbclass) and in which case we have to provide a kernel SRC_URI
that implements the kernel-yocto mechanisms (for configure) like it's done
in the other kernel recipe in meta-rm,  or we should use kernel.bbclass
only otherwise. I am worried about potential issues, since i think this is
pretty much an unsupported combo.. but if you tested it and it worked, it
might be fine for now..



>
> ------ Cheers, Rui
> >
> > +
> > > +# Make sure no branch is defined since here we track a specific
> > > version +KBRANCH = "" + +LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814" + +SRC_URI =
> > > "\ +        git://
> > >
> git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=https;nobranch=1
> > > \ +        " diff --git
> > > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb new
> > > file mode 100644 index 000000000000..88a06c4bb3c0 --- /dev/null
> > > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> > > @@ -0,0 +1,8 @@ +# Add support for Upstream Kernel for Arm
> > > Platforms (boards or simulators) + +SUMMARY = "Linux Kernel
> > > Upstream, supported by Arm/Linaro" + +require
> > > recipes-kernel/linux/linux-upstream-arm-platforms.inc + +SRCREV =
> > > "v${PV}" +LINUX_VERSION ?= "${PV}" --
> > > 2.25.1
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments
> > > are confidential and may also be privileged. If you are not the
> > > intended recipient, please notify the sender immediately and do
> > > not disclose the contents to any other person, use it for any
> > > purpose, or store or copy the information in any medium. Thank
> > > you.  
> > >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--000000000000530b7105a0a3e8d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 4:46 PM Rui M=
iguel Silva &lt;<a href=3D"mailto:rui.silva@arm.com">rui.silva@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ni=
cho,<br>
thanks for the review.<br>
<br>
On Wed, Mar 11, 2020 at 12:06:34PM +0100, Nicolas Dechesne wrote: [--<br>
Type: text/plain; charset=3DUTF-8, Encoding: 7bit, Size: 3.3K --]<br>
&gt; On Wed, Mar 11, 2020 at 11:57 AM Rui Miguel Silva<br>
&gt; &lt;<a href=3D"mailto:rui.silva@arm.com" target=3D"_blank">rui.silva@=
arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; From: Rui Silva &lt;<a href=3D"mailto:rui.silva@arm.com" target=
=3D"_blank">rui.silva@arm.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Add support to build using the upstream (Linus tree) and as firs=
t<br>
&gt; &gt; user add recipe for v5.3, which will be later.<br>
&gt; &gt;<br>
&gt; &gt; Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb<br>
&gt; &gt; Signed-off-by: Rui Miguel Silva &lt;<a href=3D"mailto:rui.silva@=
arm.com" target=3D"_blank">rui.silva@arm.com</a>&gt; ---<br>
&gt; &gt; .../linux/linux-upstream-arm-platforms.inc=C2=A0 =C2=A0 | 24<br>
&gt; &gt; +++++++++++++++++++ .../linux/<a href=3D"http://linux-upstream-a=
rm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5.3.bb</=
a><br>
&gt; &gt; |=C2=A0 8 +++++++<br>
&gt; &gt;=C2=A0 2 files changed, 32 insertions(+) create mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 meta-arm-bsp/recipes-kernel/linux/linux-upstream-ar=
m-platforms.inc<br>
&gt; &gt;=C2=A0 =C2=A0 create mode 100644 meta-arm-bsp/recipes-kernel/linu=
x/<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"http://linux-upstream-arm_5.3.bb" rel=3D=
"noreferrer" target=3D"_blank">linux-upstream-arm_5.3.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms=
.inc<br>
&gt; &gt; b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms=
.inc<br>
&gt; &gt; new file mode 100644 index 000000000000..7b73e7536d19 ---<br>
&gt; &gt; /dev/null +++<br>
&gt; &gt; b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms=
.inc<br>
&gt; &gt; @@ -0,0 +1,24 @@ +DESCRIPTION =3D &quot;Linux Kernel based on up=
stream<br>
&gt; &gt; tree&quot; +SECTION =3D &quot;kernel&quot; +LICENSE =3D &quot;GP=
Lv2&quot; +SRCREV_FORMAT =3D<br>
&gt; &gt; &quot;kernel&quot; + +require recipes-kernel/linux/linux-yocto.i=
nc +<br>
&gt; &gt; +KERNEL_VERSION_SANITY_SKIP =3D &quot;1&quot; + +S =3D &quot;${W=
ORKDIR}/git&quot; + +#<br>
&gt; &gt; Override do_kernel_configme to avoid kernel being assembled into=
 a<br>
&gt; &gt; linux-yocto +# style kernel +#<br>
&gt; &gt; <a href=3D"https://www.yoctoproject.org/docs/latest/ref-manual/r=
ef-manual.html#ref-tasks-kernel_configme" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref=
-tasks-kernel_configme</a><br>
&gt; &gt; +do_kernel_configme[noexec] =3D &quot;1&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; What are the benefits of using linux-yocto when building an upstream<=
br>
&gt; kernel? Most BSP typically define their own linux.inc file and<br>
&gt; do_configure task. I am curious about your approach here, since I<br>
&gt; haven&#39;t seen that before.<br>
<br>
The original idea was to use as much as possible the linux-yocto<br>
existing infrastructure and disable what we did not needed, but your<br>
approach also makes sense.<br>
<br>
For you this is a shipstoper? or can we go like this and change this<br>
in a follow up patch?=C2=A0 What I really want is to have as much as<br>
possible with sync with the existing recipes, and when we swap to the<br>
ones in this meta-arm then cleanup any notes.<br></blockquote><div><br></d=
iv><div>again.. it&#39;s just my thoughts on this, and what came to my mind=
 when I looked at your patch. But to me, we should either use linux-yocto (=
e.g. kernel-yocto.bbclass) and in which case we have to provide a kernel SR=
C_URI that implements the kernel-yocto mechanisms (for configure) like it&#=
39;s done in the other kernel recipe in meta-rm,=C2=A0 or we should use ker=
nel.bbclass only otherwise. I am worried about potential issues, since i th=
ink this is pretty much an unsupported combo.. but if you tested it and it =
worked, it might be fine for now..</div><div><br></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
------ Cheers, Rui<br>
&gt;<br>
&gt; +<br>
&gt; &gt; +# Make sure no branch is defined since here we track a specific=
<br>
&gt; &gt; version +KBRANCH =3D &quot;&quot; + +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814&quot=
; + +SRC_URI =3D<br>
&gt; &gt; &quot;\ +=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<br>
&gt; &gt; <a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank=
">git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=3Dhttps;n=
obranch=3D1</a><br>
&gt; &gt; \ +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; diff --git<br>
&gt; &gt; a/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-upst=
ream-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5.=
3.bb</a><br>
&gt; &gt; b/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-upst=
ream-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-arm_5.=
3.bb</a> new<br>
&gt; &gt; file mode 100644 index 000000000000..88a06c4bb3c0 --- /dev/null<=
br>
&gt; &gt; +++ b/meta-arm-bsp/recipes-kernel/linux/<a href=3D"http://linux-=
upstream-arm_5.3.bb" rel=3D"noreferrer" target=3D"_blank">linux-upstream-ar=
m_5.3.bb</a><br>
&gt; &gt; @@ -0,0 +1,8 @@ +# Add support for Upstream Kernel for Arm<br>
&gt; &gt; Platforms (boards or simulators) + +SUMMARY =3D &quot;Linux Kern=
el<br>
&gt; &gt; Upstream, supported by Arm/Linaro&quot; + +require<br>
&gt; &gt; recipes-kernel/linux/linux-upstream-arm-platforms.inc + +SRCREV =
=
=3D<br>
&gt; &gt; &quot;v${PV}&quot; +LINUX_VERSION ?=3D &quot;${PV}&quot; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt; IMPORTANT NOTICE: The contents of this email and any attachments=
<br>
&gt; &gt; are confidential and may also be privileged. If you are not the<=
br>
&gt; &gt; intended recipient, please notify the sender immediately and do<=
br>
&gt; &gt; not disclose the contents to any other person, use it for any<br=
>
&gt; &gt; purpose, or store or copy the information in any medium. Thank<b=
r>
&gt; &gt; you.=C2=A0 <br>
&gt; &gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.<br>
</blockquote></div></div>

--000000000000530b7105a0a3e8d7--
